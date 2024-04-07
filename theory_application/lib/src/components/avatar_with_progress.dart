import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AvatarWithProgress extends StatelessWidget {
  const AvatarWithProgress({super.key, required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    const radius = 34;

    return Stack(
      children: [
        CircularPercentIndicator(
          radius: radius + (4.0 * 2) + 3,
          lineWidth: 4.0,
          percent: percent / 100,
          progressColor: const Color(0xFFda07eb),
          backgroundColor: Colors.transparent,
          maskFilter: const MaskFilter.blur(BlurStyle.normal, 10),
        ),
        CircularPercentIndicator(
          radius: radius + (4.0 * 2),
          lineWidth: 4.0,
          percent: percent / 100,
          center: Container(
            width: radius * 2,
            height: radius * 2,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: const FlutterLogo(),
          ),
          progressColor: const Color(0xFFda07eb),
          backgroundColor: const Color(0xFF1f336e),
        ),
      ],
    );
  }
}
