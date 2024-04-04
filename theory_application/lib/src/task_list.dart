import 'package:flutter/material.dart';
import 'package:theory_application/src/components/round_checkbox.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: _buildCard,
        ),
      );

  Widget? _buildCard(context, index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 6.0),
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFF041955),
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
            ),
            child: Row(
              children: <Widget>[
                RoundCheckBox(
                  onTap: (v) {},
                  isChecked: index % 2 == 0 ? true : false,
                  checkedColor: index % 3 == 0
                      ? const Color(0xFFda07eb)
                      : const Color(0xFF183587),
                ),
                const SizedBox(width: 16.0),
                const Text(
                  'Lorem ipsum dolor est',
                  style: TextStyle(fontSize: 16),
                )
              ],
            )),
      ],
    );
  }
}
