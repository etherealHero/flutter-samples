import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
      ),
      width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
      child: Text(
        'Find the best coffee for you',
        style: GoogleFonts.sourceSans3(
          fontWeight: FontWeight.bold,
          height: 1.2,
          color: Colors.white,
          fontSize: 40.0,
        ),
      ),
    );
  }
}
