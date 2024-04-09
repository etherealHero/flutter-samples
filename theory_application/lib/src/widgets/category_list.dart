import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '/app.dart';
import '/src/layout_settings.dart';
import '../models/app_category.dart';
import '../components/liniar_progress_bar.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppCategory>>(
        stream: App.repository(context).listenToAppCategorys(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return LimitedBox(
              maxHeight: 125 + 32,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: snapshot.data!
                    .mapIndexed((idx, e) => _buildCard(context, idx, e))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: Text('Not categories'));
          }
        });
  }

  Widget _buildCard(BuildContext context, int index, AppCategory data) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: index == 0 ? const PagePadding().left + 15 : 15,
          top: 0,
          width: 200 - 30,
          height: 125 - 10,
          child: Container(
            width: 160.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF041955).withOpacity(0.8),
                    // color: Colors.green,
                    blurRadius: 20.0,
                    spreadRadius: 0.5,
                    offset: const Offset(0.0, 10.0))
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          width: 200.0,
          margin: EdgeInsets.only(
            left: index == 0 ? const PagePadding().left : 0,
            right: 16.0,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF041955),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${data.appTasks.length} tasks',
                style: const TextStyle(
                  color: Color(0xFF6d7fb6),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 20.0),
              LiniarProgressBar(
                color: Color(data.color),
                percent: index % 2 == 0 ? 70 : 30,
              ),
              const SizedBox(height: 5.0)
            ],
          ),
        ),
      ],
    );
  }
}
