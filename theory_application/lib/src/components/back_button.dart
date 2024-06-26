import 'package:flutter/material.dart';

class BackButtonOutlined extends StatelessWidget {
  const BackButtonOutlined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pop(context),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      shape: const StadiumBorder(
          side: BorderSide(color: Color(0xFF1f336e), width: 2)),
      heroTag: null,
      child: Icon(
        Icons.close_rounded,
        color: Colors.white.withOpacity(0.8),
        size: 26.0,
      ),
    );
  }
}
