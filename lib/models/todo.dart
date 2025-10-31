import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Todo {
  final int id;
  final String title;
  final bool completed;
  List<String> tags;
  Color color;
  Todo({required this.id,required this.title,required this.completed, required this.tags,required this.color});
  
  static Todo fromJson(Map<String, dynamic> json) {
    final tags =
        (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [];

    return Todo(
      id: json['id'],
      title: json['title'],
      tags: tags,
      completed: json['completed'],
      color: json['color'] != null
          ? Color(int.parse(json['color'], radix: 16))
          : Colors.yellowAccent,
    );
  }
}