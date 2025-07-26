import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BookCardDTO.dart';

class Bookstatistics extends StatelessWidget {
  const Bookstatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookCardDTO>>(
      future: BookCardDTO.loadDriveFiles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        final dto = snapshot.data ?? [];

        return Scaffold(
          appBar: AppBar(
            title: Text('Quantidade de livros em ${DateTime.now().year}'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Círculo com número dentro
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        dto
                            .where(
                              (x) => x.CreatedAt.year == DateTime.now().year,
                            )
                            .length
                            .toString(),
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Gráfico de colunas
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: BarChartExample(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BarChartExample extends StatelessWidget {
  const BarChartExample({super.key});

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
