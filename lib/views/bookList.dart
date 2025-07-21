import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BookCardDTO.dart';
import 'package:flutter_application_1/views/widgets/bookCard.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    var s = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[BookCard(dto: BookCardDTO(id: 'id'))],
      ),
    );
    return s;
  }
}
