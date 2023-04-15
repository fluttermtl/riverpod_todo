import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/todo_provider.dart';

class TodoList extends ConsumerWidget {
  const TodoList({
    super.key,
    this.filter = TodoFilter.all,
  });

  final TodoFilter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosProvider(filter));

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, idx) => CheckboxListTile(
        title: Text(todos[idx].name),
        value: todos[idx].completed,
        onChanged: (_) =>
            ref.read(todosProvider.notifier).toggle(todos[idx].id),
      ),
    );
  }
}
