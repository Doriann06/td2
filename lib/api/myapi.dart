import 'package:td2_app/models/task.dart';

class MyAPI {
  // API methods will be defined here
  Future<List<Task>> getTask() async {
    await Future.delayed(const Duration(seconds: 1));
    final dataString = await _loadAsset('assets/json/tasks.json');
    final Map<String, dynamic> json = jsonDecode(dataString);
    if (json['tasks'] != null) {
      final tasks = <Task>[];
      json['tasks'].forEach((element) {
        tasks.add(element);
      });
      return tasks;
    } else {
      return [];
    }
  }
    Future<String> _loadAsset(String path) async {
        return await rootBundle.loadString(path);
    }
}