import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:theory_application/src/widgets/total_tasks_chart.dart';

import '../components/avatar_with_progress.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required AdvancedDrawerController advancedDrawerController,
  }) : _advancedDrawerController = advancedDrawerController;

  final AdvancedDrawerController _advancedDrawerController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        contentPadding: const EdgeInsets.only(left: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70.0),

            // Back button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => _advancedDrawerController.hideDrawer(),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  shape: const StadiumBorder(
                      side: BorderSide(color: Color(0xFF1f336e), width: 2)),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16.0,
                  ),
                ),
                const SizedBox(width: 20.0)
              ],
            ),

            // Avatar
            const Padding(
              padding: EdgeInsets.only(left: 33.0),
              child: AvatarWithProgress(percent: 40),
            ),
            const SizedBox(height: 10.0),

            // UserName
            const Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Text(
                'Olivia\nMitchell',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.bookmark_border_outlined,
                color: Color(0xFF3f5598),
              ),
              title: const Text('Templates'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.window_outlined,
                color: Color(0xFF3f5598),
              ),
              title: const Text('Categories'),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.area_chart_outlined,
                color: Color(0xFF3f5598),
              ),
              title: const Text('Analytics'),
            ),
            const Spacer(),
            const TotalTasksChart(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16.0, left: 40.0),
                child: const Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
