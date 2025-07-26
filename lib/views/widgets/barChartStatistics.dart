import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartStatistics extends StatelessWidget {
  const BarChartStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitles,
            ),
          ),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [BarChartRodData(toY: 8, color: Colors.blue)],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [BarChartRodData(toY: 12, color: Colors.orange)],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [BarChartRodData(toY: 10, color: Colors.green)],
          ),
        ],
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);
    switch (value.toInt()) {
      case 0:
        return Text('Jan', style: style);
      case 1:
        return Text('Fev', style: style);
      case 2:
        return Text('Mar', style: style);
      default:
        return const SizedBox.shrink();
    }
  }
}
