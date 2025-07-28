import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/barChartDTO.dart';
import 'package:flutter_application_1/models/book_card_dto.dart';
import 'package:flutter_application_1/services/LoadFromJson.dart';
import 'package:flutter_application_1/views/widgets/barChartStatistics.dart';

class Bookstatistics extends StatelessWidget {
  const Bookstatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookCardDTO>>(
      future: LoadFromJson<BookCardDTO>(
        path: 'assets/drive_files.json',
        fromJson: (json) => BookCardDTO.fromJson(json),
      ).loadFromFile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        final _dto = snapshot.data ?? [];
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
                        _dto
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: BarChartStatistics(
                      dto: BarChartDTO.fromListBookCard(_dto),
                    ),
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
