import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/BookCardDTO.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.dto});
  final BookCardDTO dto;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          //debugPrint(this.dto.FileName);
        },
        child: SizedBox(
          height: 100,
          width: double.infinity, // preenche a largura disponível
          child: Row(
            children: [
              // Imagem à esquerda
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  "assets/thumbnails/" + dto.FileName,
                  width: 100,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Texto
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dto.FileName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        dto.CreatedAt,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
