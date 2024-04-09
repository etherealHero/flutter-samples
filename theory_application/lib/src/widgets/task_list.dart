import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '/app.dart';
import '../models/app_task.dart';
import '/src/layout_settings.dart';
import '/src/components/round_checkbox.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) => StreamBuilder<List<AppTask>>(
      stream: App.repository(context).listenToAppTasks(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: snapshot.data!
                  .mapIndexed((idx, e) => _buildCard(context, idx, e))
                  .toList(),
            ),
          );
        } else {
          return const Center(child: Text('Not tasks'));
        }
      });

  Widget _buildCard(BuildContext context, int index, AppTask data) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            margin: EdgeInsets.only(
              left: const PagePadding().left,
              right: const PagePadding().right,
              bottom: 6.0,
            ),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFF041955),
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            child: Row(
              children: <Widget>[
                RoundCheckBox(
                  onTap: (v) =>
                      App.repository(context).toggleTaskStatus(data.id, v!),
                  isChecked: data.isDone,
                  checkedColor: index % 3 == 0
                      ? const Color(0xFFda07eb)
                      : const Color(0xFF183587),
                ),
                const SizedBox(width: 16.0),
                Text(
                  data.title,
                  style: TextStyle(
                      fontSize: 16,
                      decoration: data.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.white.withOpacity(data.isDone ? 0.5 : 1)),
                )
              ],
            )),
      ],
    );
  }
}
