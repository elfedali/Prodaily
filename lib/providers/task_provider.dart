import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prodaily/models/task.dart';
class TaskProvider extends ChangeNotifier {
 List<Task> _tasks = <Task>[];
  List<Task> get tasks => _tasks;
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
  void editTask(Task task) {
    _tasks[_tasks.indexWhere((element) => element.id == task.id)] = task;
    notifyListeners();
  }
  // todo: Function to fetch data from the api

}