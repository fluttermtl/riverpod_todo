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
List<Todo> filteredTodos(FilteredTodosRef ref, TodoFilter filter) {
  final todos = ref.watch(todosProvider);
  if (filter == TodoFilter.all) {
    return todos;
  }

  return todos
      .where((todo) => todo.completed == (filter == TodoFilter.completed))
      .toList();
}
