import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/todo_provider.dart';

class TodoTextField extends ConsumerWidget {
  TodoTextField({
    super.key,
  });

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
        labelText: 'What needs to be done?',
      ),
      onSubmitted: (value) {
        ref.read(todosProvider.notifier).add(value);
        textEditingController.clear();
      },
    );
  }
}
