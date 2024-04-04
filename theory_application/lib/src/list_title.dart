import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: Color(0xFF8ca9f5),
          fontWeight: FontWeight.w600,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
