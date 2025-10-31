import 'package:flutter/material.dart';

import '../models/todo.dart';

class Detail extends StatelessWidget {
  final Todo todo;

  const Detail({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo ${todo.title} detail')),
      body: Center(
        child: Column(
          children: [
            Card(
              color: todo.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.key)),
                title: const Text('Identifiant'),
                subtitle: Text('${todo.id}'),
              ),
            ),
            Card(
              color: todo.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.title)),
                title: const Text('Titre de la tache'),
                subtitle: Text(todo.title),
              ),
            ),
            Card(
              color: todo.color,
              elevation: 7,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: (const Icon(Icons.description)),
                title: const Text('Est complété '),
                subtitle: Text(todo.completed ? 'Oui' : 'Non'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
