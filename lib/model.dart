import 'package:flutter/material.dart';

class NewTask {
  String message;
  bool isCompleted;

  NewTask({required this.message, this.isCompleted = false});

  void toggleCompleted(NewTask) {
    isCompleted = !isCompleted;
  }
}

class MyState extends ChangeNotifier {
  late List<NewTask> _list = [];
  int _filterBy = 3;

  List<NewTask> get list => _list;

  int get filterBy => _filterBy;

  void setFilterBy(int filterBy) {
    _filterBy = filterBy;
    notifyListeners();
  }

  void addTask(NewTask task) {
    _list.add(task);
    notifyListeners();
  }

  void removeTask(NewTask task) {
    _list.remove(task);
    notifyListeners();
  }

  void isCompleted(NewTask task) {
    task.toggleCompleted(task);
    notifyListeners();
  }
}
