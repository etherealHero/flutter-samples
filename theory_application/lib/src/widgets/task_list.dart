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
                  .mapIndexed(
                    (index, element) => Column(
                      children: [
                        Stack(children: [
                          Dismissible(
                            key: Key(element.id.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${element.title} deleted")),
                              );
                            },
                            confirmDismiss: (_) async {
                              App.repository(context)
                                  .setTaskMarkToDeleteStatus(element.id, true);
                              await Future.delayed(const Duration(seconds: 2));

                              if (!context.mounted) return Future.value(false);

                              bool isNeedDeleted = await App.repository(context)
                                  .isAppTaskNeedDelete(element.id);

                              if (!isNeedDeleted) {
                                return Future.value(false);
                              }

                              if (!context.mounted) return Future.value(false);

                              Future.delayed(const Duration(seconds: 1), () {
                                App.repository(context).removeTask(element.id);
                              });

                              App.repository(context)
                                  .setTaskMarkToDeleteStatus(element.id, false);

                              return Future.value(true);
                            },
                            child: TaskCard(index: index, appTask: element),
                          ),
                          Visibility(
                            visible: element.markToDelete,
                            child: UnmarkTaskForDelete(taskId: element.id),
                          ),
                        ]),
                        const SizedBox(height: 6.0),
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return const Center(child: Text('Not tasks'));
        }
      });
}

class UnmarkTaskForDelete extends StatelessWidget {
  const UnmarkTaskForDelete({
    super.key,
    required this.taskId,
  });

  final int taskId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: const PagePadding(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.delete_outline_rounded,
                  color: Color(0xFF8ca9f5),
                ),
                SizedBox(width: 10.0),
                Text('The task was deleted',
                    style: TextStyle(
                      color: Color(0xFF8ca9f5),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    )),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                App.repository(context)
                    .setTaskMarkToDeleteStatus(taskId, false);
              },
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(EdgeInsets.all(18.0)),
                side: MaterialStatePropertyAll(BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 2.0,
                    style: BorderStyle.solid)),
              ),
              child: Text(
                'UNDO',
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.appTask,
    required this.index,
  });

  final AppTask appTask;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            margin: EdgeInsets.only(
              left: const PagePadding().left,
              right: const PagePadding().right,
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
                      App.repository(context).setTaskDoneStatus(appTask.id, v!),
                  isChecked: appTask.isDone,
                  checkedColor: index % 3 == 0
                      ? const Color(0xFFda07eb)
                      : const Color(0xFF183587),
                ),
                const SizedBox(width: 16.0),
                Text(
                  appTask.title,
                  style: TextStyle(
                      fontSize: 16,
                      decoration: appTask.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color:
                          Colors.white.withOpacity(appTask.isDone ? 0.5 : 1)),
                )
              ],
            )),
      ],
    );
  }
}
