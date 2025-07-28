import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/barChartDTO.dart';

class BarChartStatistics extends StatelessWidget {
  const BarChartStatistics({super.key, required this.dto});
  final BarChartDTO dto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: dto.maxY.toDouble(),
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      value.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 10,
                        overflow: TextOverflow.visible, // ou .clip
                      ),
                      softWrap: false, // Impede quebra de linha
                    ),
                  );
                },
                reservedSize: 28, // aumenta espaço se necessário
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          //corrigir
          barGroups: dto.barChart,
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 12);

    return Text(dto.chartNames[value.toInt()], style: style);

    // switch (value.toInt()) {
    //   case 0:
    //     return Text('Jan', style: style);
    //   case 1:
    //     return Text('Fev', style: style);
    //   case 2:
    //     return Text('Mar', style: style);
    //   default:
    //     return const SizedBox.shrink();
    // }
  }
}
