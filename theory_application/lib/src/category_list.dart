import 'package:flutter/material.dart';

import 'components/liniar_progress_bar.dart';

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
          left: index == 0 ? 16 + 15 : 15,
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
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
          width: 200.0,
          margin: EdgeInsets.only(left: index == 0 ? 16 : 0, right: 16),
          decoration: const BoxDecoration(
            color: Color(0xFF041955),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '40 tasks',
                style: TextStyle(
                  color: Color(0xFF6d7fb6),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                'Business',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  letterSpacing: 0.8,
                ),
              ),
              SizedBox(height: 20.0),
              LiniarProgressBar(color: Color(0xFFda07eb), percent: 70.0),
              SizedBox(height: 5.0)
            ],
          ),
        ),
      ],
    );
  }
}
