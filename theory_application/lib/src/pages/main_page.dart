import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../layout_settings.dart';
import '../widgets/category_list.dart';
import '../components/list_title.dart';
import '../widgets/task_list.dart';
import 'main_drawer.dart';
import 'add_task_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF041955),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
      drawer: MainDrawer(advancedDrawerController: _advancedDrawerController),
      child: MainScaffold(advancedDrawerController: _advancedDrawerController),
    );
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required AdvancedDrawerController advancedDrawerController,
  }) : _advancedDrawerController = advancedDrawerController;

  final AdvancedDrawerController _advancedDrawerController;

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
                onPressed: _handleMenuButtonPressed,
                color: const Color(0xFF87a4f0),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskPage()),
            );
          },
          backgroundColor: const Color(0xFFda07eb),
          shape: const CircleBorder(),
          heroTag: null,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
