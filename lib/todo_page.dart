import 'package:flutter/material.dart';
import 'package:riverpod_todo/todo_list.dart';
import 'package:riverpod_todo/todo_provider.dart';
import 'package:riverpod_todo/todo_text_field.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<bool> selectedFilter = [true, false, false];
  final filterOptions = const [
    Text("All"),
    Text("Active"),
    Text("Completed"),
  ];

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
              isSelected: selectedFilter,
              onPressed: (int index) {
                setState(() {
                  selectedFilter = [
                    for (int i = 0; i < selectedFilter.length; i++)
                      i == index ? true : false
                  ];
                });
              },
              children: filterOptions,
            ),
            Expanded(
              child: TodoList(
                filter: TodoFilter.values[selectedFilter.indexWhere(
                  (element) => element == true,
                )],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
