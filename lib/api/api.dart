import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class API {
  // URL de l'API
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos/";

  // Fonction pour récupérer les données
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erreur lors du chargement des données");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des données"),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erreur : ${snapshot.error}"));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text("ID : ${data[index]['id']}"),
                );
              },
            );
          }
        },
      ),
    );
  }
  static Future<List<Todo>> getTodos() async {
    final String apiUrl = "https://jsonplaceholder.typicode.com/todos/";
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Todo> todos = jsonData.map((item) => Todo.fromJson(item)).toList();
      return todos;
    } else {
      throw Exception("Erreur lors du chargement des données");
    }
  }
}
  