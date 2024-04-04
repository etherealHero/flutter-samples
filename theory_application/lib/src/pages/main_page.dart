import 'package:flutter/material.dart';
import 'package:theory_application/src/category_list.dart';
import 'package:theory_application/src/list_title.dart';
import 'package:theory_application/src/task_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: 90.0,
        leading: IconButton(
          color: const Color(0xFF87a4f0),
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        actions: [
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
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }
}
