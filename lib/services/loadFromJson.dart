import 'dart:convert';
import 'package:flutter/services.dart';

class LoadFromJson<T> {
  final String path;
  final T Function(Map<String, dynamic>) fromJson;

  const LoadFromJson({required this.path, required this.fromJson});

  Future<List<T>> loadFromFile() async {
    final String response = await rootBundle.loadString(path);
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => fromJson(json)).toList();
  }
}
