import 'package:flutter/material.dart';
import 'package:afs_cappuccino/color_palette.dart';
import 'package:afs_cappuccino/widgets/categories.dart';
import 'package:afs_cappuccino/widgets/coffee_carousel.dart';
import 'package:afs_cappuccino/widgets/header_nav.dart';
import 'package:afs_cappuccino/widgets/search_bar.dart';
import 'package:afs_cappuccino/widgets/header_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorPalette().scaffoldBg,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorPalette().accentColor,
        unselectedItemColor: ColorPalette().secondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        onTap: (value) => setState(() {
          _currentTab = value;
        }),
        items: const [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home_rounded, size: 28.0),
          ),
          BottomNavigationBarItem(
            label: "shopping_bag",
            icon: Icon(Icons.breakfast_dining_rounded, size: 28.0),
          ),
          BottomNavigationBarItem(
            label: "heart",
            icon: Icon(Icons.favorite_sharp, size: 28.0),
          ),
          BottomNavigationBarItem(
            label: "bell",
            icon: Icon(Icons.notifications_rounded, size: 28.0),
          ),
        ],
      ),
      body: const SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderNav(),
              HeaderTitle(),
              SizedBox(height: 20.0),
              CSearchBar(),
              Categories(),
              CoffeeCarousel()
            ],
          )
        ],
      )),
    );
  }
}
