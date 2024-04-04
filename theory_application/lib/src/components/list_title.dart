import 'package:flutter/material.dart';
import '../layout_settings.dart';

class ListTitle extends StatelessWidget {
  const ListTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding(),
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
