import 'package:flutter/material.dart';

import '/src/layout_settings.dart';
import '../components/liniar_progress_bar.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) => LimitedBox(
        maxHeight: 125 + 32,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: _buildCard,
        ),
      );

  Widget? _buildCard(context, index) {
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
                '${index % 2 == 0 ? 40 : 18} tasks',
                style: const TextStyle(
                  color: Color(0xFF6d7fb6),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                index % 2 == 0 ? 'Business' : 'Personal',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 20.0),
              LiniarProgressBar(
                  color: index % 2 == 0
                      ? const Color(0xFFda07eb)
                      : const Color(0xFF237bff),
                  percent: index % 2 == 0 ? 70 : 30),
              const SizedBox(height: 5.0)
            ],
          ),
        ),
      ],
    );
  }
}
