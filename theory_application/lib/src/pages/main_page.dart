import 'package:flutter/material.dart';

import '../layout_settings.dart';
import '../widgets/category_list.dart';
import '../components/list_title.dart';
import '../widgets/task_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        toolbarHeight: 90.0,
        centerTitle: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(
            left: const PagePadding().left - 10,
            right: const PagePadding().right - 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                color: const Color(0xFF87a4f0),
                onPressed: () {},
                icon: const Icon(Icons.menu_rounded),
              ),
              Row(
                children: [
                  IconButton(
                    color: const Color(0xFF87a4f0),
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  ),
                  IconButton(
                    color: const Color(0xFF87a4f0),
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: PagePadding(),
            child: Text(
              'What\'s Up, Olivia!',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 22.0),
          ListTitle('Categories'),
          SizedBox(height: 5.0),
          CategoryList(),
          SizedBox(height: 10.0),
          ListTitle('Today\'s tasks'),
          TaskList()
        ],
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color(0xFFda07eb).withOpacity(0.35),
            blurRadius: 18.0,
            spreadRadius: 2.0,
            offset: const Offset(-4, 8),
          )
        ], borderRadius: BorderRadius.circular(100)),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFFda07eb),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
