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
  }) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
    );
  }
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
    state = state
        .map(
          (e) => e.id == id ? e.copyWith(completed: !e.completed) : e,
        )
        .toList();
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
  if (filter == TodoFilter.all) {
    return ref.watch(todosProvider);
  }

  return ref
      .watch(todosProvider)
      .where((element) => element.completed == (filter == TodoFilter.completed))
      .toList();
}
