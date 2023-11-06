import 'package:flutter/material.dart';
import 'package:todo_list_tutorial/todo.dart';

class NewTodoDialog extends StatelessWidget {
  NewTodoDialog({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
      ),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        ElevatedButton(
            onPressed: () {
              final todo = Todo(title: controller.value.text, isDone: false);

              controller.clear();

              Navigator.of(context).pop(todo);
            },
            child: const Text('Add')),
      ],
    );
  }
}
