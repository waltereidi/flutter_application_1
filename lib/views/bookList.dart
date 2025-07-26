import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/bookCardDTO.dart';
import 'package:flutter_application_1/services/LoadFromJson.dart';
import 'package:flutter_application_1/views/widgets/bookCard.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

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

        final files = snapshot.data ?? [];

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              final dto = files[index];
              return BookCard(dto: dto);
            },
          ),
        );
      },
    );
  }
}
