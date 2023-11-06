import 'package:flutter/material.dart';

class ImageTitle extends StatelessWidget {
  const ImageTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
