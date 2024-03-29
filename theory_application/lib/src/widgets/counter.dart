import 'package:flutter/material.dart';

class TopCounter extends StatelessWidget {
  const TopCounter(
    this.count, {
    super.key,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$count",
      style: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
