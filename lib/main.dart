import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/todo_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<bool> selectedFilter = [true, false, false];
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
              children: const <Widget>[
                Text("All"),
                Text("Active"),
                Text("Completed"),
              ],
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
        value: todos[idx].completed,
        onChanged: (_) => ref.read(todosProvider.notifier).toggle(
              todos[idx].id,
            ),
        title: Text(todos[idx].name),
      ),
    );
  }
}
