import 'package:flutter/material.dart';
import 'package:theory_application/src/models/app_task.dart';

import '/app.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton(this.appTaskCb, {super.key});

  final AppTask Function() appTaskCb;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await App.repository(context).saveAppTask(appTaskCb());

        if (!context.mounted) return;

        Navigator.pop(context);
      },
      style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
            vertical: 18.0,
            horizontal: 26.0,
          )),
          backgroundColor: MaterialStatePropertyAll(Color(0xFFda07eb))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'New task',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 10.0),
          Icon(
            Icons.keyboard_arrow_up_rounded,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
