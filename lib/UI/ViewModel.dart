import 'package:flutter/material.dart';
import 'package:td2_app/repository/settings_repository.dart';
import '../models/task.dart ';
class SettingViewModel extends ChangeNotifier {
  late bool _isDark;
  late SettingRepository _settingRepository;
  bool get isDark => _isDark;

  SettingViewModel() {
    _isDark = false;
    _settingRepository = SettingRepository();
    getSettings();
  }
  //Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _settingRepository.saveSettings(value);
    notifyListeners();
  }
  getSettings() async {
    _isDark = await _settingRepository.getSettings();
    notifyListeners();
  }
}
class TaskViewModel extends ChangeNotifier{
  late List<Task> liste;

  TaskViewModel(){
    liste=[];
  }
  void addTask(Task task){
    liste.add(task);
    notifyListeners();
  }
  void generateTasks(){
    liste = Task.generateTask(50);
    notifyListeners();
  }
}
