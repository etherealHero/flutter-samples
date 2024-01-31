import 'package:afs_cappuccino/color_palette.dart';
import 'package:colorful_iconify_flutter/icons/icon_park.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class CSearchBar extends StatefulWidget {
  const CSearchBar({super.key});

  @override
  State<CSearchBar> createState() => _CSearchBarState();
}

class _CSearchBarState extends State<CSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 50.0,
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: ColorPalette().searchBarFill,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 2.0, 13.0),
            hoverColor: ColorPalette().searchBarFill,
            filled: true,
            fillColor: ColorPalette().searchBarFill,
            hintText: 'Find Your Coffee...',
            hintStyle: GoogleFonts.sourceSans3(
              color: ColorPalette().secondaryColor,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Iconify(
                IconPark.search,
                color: ColorPalette().secondaryColor,
              ),
            ),
            prefixIconColor: ColorPalette().secondaryColor,
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 40.0,
              maxHeight: 20.0,
            ),
          ),
          style: GoogleFonts.sourceSans3(color: ColorPalette().secondaryColor),
        ),
      ),
    );
  }
}
