import 'package:flutter/material.dart';
import 'package:afs_cappuccino/color_palette.dart';
import 'package:afs_cappuccino/widgets/categories.dart';
import 'package:afs_cappuccino/widgets/header_nav.dart';
import 'package:afs_cappuccino/widgets/search_bar.dart';
import 'package:afs_cappuccino/widgets/header_title.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
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
              Categories()
            ],
          )
        ],
      )),
    );
  }
}
