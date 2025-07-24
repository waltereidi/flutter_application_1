import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BookCardDTO.dart';
import 'package:flutter_application_1/views/widgets/bookCard.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  // Widget build(BuildContext context) {
  //   var result = Padding(
  //     padding: EdgeInsets.all(8.0),
  //     child: Column(children: <Widget>[BookCard(dto: bookCardDTO)]),
  //   );
  //   return result;
  // }
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookCardDTO>>(
      future: loadDriveFiles(),
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

  Future<List<BookCardDTO>> loadDriveFiles() async {
    final String response = await rootBundle.loadString(
      'assets/drive_files.json',
    );
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => BookCardDTO.fromJson(json)).toList();
  }
}
