import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/book_card_dto.dart';

class BarChartDTO {
  final int maxY;
  final List<BarChartGroupData> barChart;
  final List<String> chartNames;

  const BarChartDTO({
    required this.maxY,
    required this.barChart,
    required this.chartNames,
  });

  factory BarChartDTO.fromListBookCard(List<BookCardDTO> books) {
    List<(int, int)> record = [];
    List<BarChartGroupData> bc = [];
    List<String> cn = [];

    int maxY = 0;
    var queue = getColors();

    books.forEach((f) {
      if (!record.any((x) => x.$1 == f.CreatedAt.year)) {
        record.add((f.CreatedAt.year, 1));
      } else {
        //corrigir
        int i = record.indexWhere((x) => x.$1 == f.CreatedAt.year);
        print(i);
        var novo = record.elementAt(i);
        record[i] = (novo.$1, novo.$2 + 1);
        maxY = maxY > novo.$2 + 1 ? novo.$2 + 1 : maxY;
      }
    });
    record.sort((a, b) => a.$1 > b.$1 ? 0 : 1);

    record.forEach((f) {
      cn.add(f.$1.toString());

      bc.add(
        BarChartGroupData(
          x: bc.length + 1,
          barRods: [
            BarChartRodData(
              toY: f.$2.toDouble(),
              color: queue.removeFirst(),
              width: 12,
            ),
          ],
        ),
      );
    });

    return BarChartDTO(maxY: maxY, barChart: bc, chartNames: cn);
  }

  static Queue<Color> getColors() {
    var queue = Queue<Color>();
    queue.addAll([
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.cyan,
      Colors.indigo,
      Colors.pink,
    ]);
    return queue;
  }
}
