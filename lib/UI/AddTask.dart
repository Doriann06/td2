import 'package:flutter/material.dart';
import '../models/task.dart';
import 'ViewModel.dart';
import 'package:provider/provider.dart';
class AddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.redAccent,
            backgroundColor: Colors.lightBlue,
          ),
          onPressed: () {
            //context.read<TaskViewModel>().addTask(Task.newTasks());
            Navigator.pop(context);
          },
          child: const Text("Add Task"),
        ),
      ),
    ) ;
  }
}