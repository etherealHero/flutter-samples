import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7.0),
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: const Color(0xFF191A1B),
              ),
              child: const Iconify(
                HeroiconsSolid.view_grid,
                color: Color(0xFF4D4F52),
                size: 32.0,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7.0),
              width: 42.0,
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/model.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
