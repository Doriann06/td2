
import 'dart:convert';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class API {
  
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
  