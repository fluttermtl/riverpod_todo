import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

@immutable
class Todo {
  const Todo({
    required this.id,
    required this.name,
    this.completed = false,
  });

  final String id;
  final String name;
  final bool completed;

  Todo copyWith({
    String? id,
    String? name,
    bool? completed,
  }) =>
      Todo(
        id: id ?? this.id,
        name: name ?? this.name,
        completed: completed ?? this.completed,
      );

  // changes the "==" operator to take count of object type and fields
  @override
  bool operator == (Object other){
    if(identical(this, other)) return true;
    
    return other is Todo && other.id == id && other.name == name && other.completed == completed;    
  }

  // two object that is equals needs to point to the same hash
  // it's to avoid duplicates keys when creating keys values with Map
  @override
  int get hashCode => Object.hash(id.hashCode, name.hashCode, completed.hashCode);

  // for debugging this object
  @override
  String toString() => 'Todo(id: $id, name: $name, completed: $completed)';

}

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() => [];

  void add(String name) {
    state = [
      ...state,
      Todo(id: const Uuid().v4(), name: name),
    ];
  }

  void toggle(String id) {
    state = List.generate(state.length, (index) {
      final todo = state[index];
      return todo.id == id ? todo.copyWith(completed: !todo.completed) : todo;
    });
  }
}

enum TodoFilter {
  all,
  active,
  completed;

  const TodoFilter();
}

@riverpod
List<Todo> filteredTodos(Ref ref, TodoFilter filter) {
  final todos = ref.watch(todosProvider);
  if (filter == TodoFilter.all) {
    return todos;
  }

  return todos
      .where((todo) => todo.completed == (filter == TodoFilter.completed))
      .toList();
}
