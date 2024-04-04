import 'package:flutter/material.dart';

class LiniarProgressBar extends StatelessWidget {
  const LiniarProgressBar({
    super.key,
    required this.color,
    required this.percent,
  });

  final Color color;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 3.5,
            color: const Color(0xFF6d7fb6),
          ),
          Positioned(
            bottom: 0.0,
            left: maxWidth / 100 * percent - (3.5 / 2),
            child: Container(
              height: 7.0,
              width: 3.5,
              color: color,
            ),
          ),
          Container(
            height: 3.5,
            width: maxWidth / 100 * percent,
            decoration: BoxDecoration(
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.4),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
