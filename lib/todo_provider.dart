import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo_provider.g.dart';

class Todo {
  String id;
  String name;
  bool completed;
  Todo({
    required this.id,
    required this.name,
    this.completed = false,
  });
}

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [];
  }

  void add(String name) {
    state = [...state, Todo(id: const Uuid().v4(), name: name)];
  }

  void delete(String id) {
    state = state.where((element) => element.id == id).toList();
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(id: todo.id, name: todo.name, completed: !todo.completed)
        else
          todo,
    ];
  }
}

enum TodoFilter {
  all(0),
  active(1),
  completed(2);

  const TodoFilter(this.value);
  final int value;
}

@riverpod
List<Todo> filteredTodos(FilteredTodosRef ref, TodoFilter filter) {
  if (filter == TodoFilter.all) return ref.watch(todosProvider);
  return ref
      .watch(todosProvider)
      .where((element) => element.completed == (filter == TodoFilter.completed))
      .toList();
}
