import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalTasksChart extends StatefulWidget {
  const TotalTasksChart({super.key});

  @override
  State<TotalTasksChart> createState() => _TotalTasksChartState();
}

class _TotalTasksChartState extends State<TotalTasksChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.8,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0.0,
            top: 8.0,
            right: 0.0,
            bottom: -8.0,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: LineChart(mainData()),
            ),
          ),
          LineChart(mainData()),
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: const Color(0xFFda07eb),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
    );
  }
}
