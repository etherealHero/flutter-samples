import 'package:flutter/material.dart';

class CategoryPoint extends StatelessWidget {
  const CategoryPoint({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 2.0),
      ),
      child: Center(
        child: Container(
          width: 11.5,
          height: 11.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
