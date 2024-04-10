import 'package:flutter/material.dart';
import 'package:theory_application/src/models/app_task.dart';

import '../components/add_task_button.dart';
import '../components/back_button.dart';
import '../components/category_point.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF041955),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const SizedBox(height: 60.0),
              TextFormField(
                autofocus: true,
                controller: _textController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter new task',
                    hintStyle: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.normal)),
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.normal),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(18.0)),
                      side: MaterialStatePropertyAll(BorderSide(
                          color: Colors.white.withAlpha(40),
                          width: 2.0,
                          style: BorderStyle.solid)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white.withAlpha(190),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          'Today',
                          style: TextStyle(color: Colors.white.withAlpha(190)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(20.0)),
                      shape: const MaterialStatePropertyAll(CircleBorder()),
                      side: MaterialStatePropertyAll(BorderSide(
                          color: Colors.white.withAlpha(40),
                          width: 2.0,
                          style: BorderStyle.solid)),
                    ),
                    child: const CategoryPoint(color: Color(0xFF0869ff)),
                  ),
                ],
              ),
              const SizedBox(height: 90.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.create_new_folder_outlined),
                    iconSize: 30.0,
                    color: Colors.white.withAlpha(160),
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.outlined_flag_rounded),
                    iconSize: 30.0,
                    color: Colors.white.withAlpha(160),
                  ),
                  const SizedBox(width: 20.0),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dark_mode_outlined),
                    iconSize: 30.0,
                    color: Colors.white.withAlpha(160),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTaskButton(
                    () => AppTask(
                      title: _textController.text,
                      description: "",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
      floatingActionButton: const Column(
        children: [
          SizedBox(height: 30.0),
          BackButtonOutlined(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
