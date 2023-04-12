import 'package:flutter/material.dart';
import 'package:riverpod_todo/todo_list.dart';
import 'package:riverpod_todo/todo_provider.dart';
import 'package:riverpod_todo/todo_text_field.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

extension TodoFilterEtx on TodoFilter {
  List<bool> toList() => List.generate(
        TodoFilter.values.length,
        (idx) => index == idx,
      );
}

class _TodoPageState extends State<TodoPage> {
  TodoFilter selectedFilter = TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TodoTextField(),
            ToggleButtons(
              isSelected: selectedFilter.toList(),
              onPressed: (int index) {
                setState(() {
                  selectedFilter = TodoFilter.values[index];
                });
              },
              children: const [
                Text("All"),
                Text("Active"),
                Text("Completed"),
              ],
            ),
            Expanded(
              child: TodoList(filter: selectedFilter),
            ),
          ],
        ),
      ),
    );
  }
}
