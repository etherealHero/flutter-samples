import 'package:afs_cappuccino/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> coffeTypes = [
    "Cappiccino",
    "Expresso",
    "Latte",
    "Flat White"
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
      ),
      child: ShaderMask(
        shaderCallback: (bounds) {
          return LinearGradient(
            begin: const Alignment(0.7, -1.0),
            end: const Alignment(1.0, -1.0),
            colors: <Color>[ColorPalette().scaffoldBg, Colors.transparent],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: SizedBox(
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: coffeTypes
                .asMap()
                .entries
                .map(
                  (e) => GestureDetector(
                      onTap: () => setState(() {
                            selectedIndex = e.key;
                          }),
                      child: CoffeeType(
                        type: e.value,
                        index: e.key,
                        isMark: e.key == selectedIndex,
                      )),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CoffeeType extends StatelessWidget {
  const CoffeeType({
    super.key,
    required this.type,
    required this.index,
    required this.isMark,
  });

  final bool isMark;
  final String type;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double firstPadding = index == 0 ? 0.0 : 14.0;
    final double lastPadding = index == 3 ? 24.0 : 14.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(firstPadding, 14.0, lastPadding, 14.0),
      child: Column(
        children: [
          Text(type,
              style: GoogleFonts.sourceSans3(
                color: isMark
                    ? ColorPalette().accentColor
                    : ColorPalette().secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )),
          const SizedBox(
            height: 4.0,
          ),
          Container(
            width: 6.0,
            height: 6.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              color: isMark ? ColorPalette().accentColor : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
