import 'package:flutter/material.dart';
import 'package:todo_list_tutorial/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos, required this.onTodoToggle});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (isChecked) => onTodoToggle(todo, isChecked!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}
