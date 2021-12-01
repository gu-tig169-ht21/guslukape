import 'package:flutter/material.dart';
import 'package:julkort1/apifetcher.dart';

class NewTask {
  String message;
  bool isCompleted;
  String id;

  NewTask({required this.message, this.isCompleted = false, required this.id});

  void toggleCompleted(NewTask task) {
    isCompleted = !isCompleted;
  }

  static Map<String, dynamic> toJson(NewTask task) {
    return {
      'title': task.message,
      'done': task.isCompleted,
    };
  }

  static NewTask fromJson(Map<String, dynamic> json) {
    return NewTask(
      message: json['title'],
      isCompleted: json['done'],
      id: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<NewTask> _list = [];
  int _filterBy = 0;

  List<NewTask> get list => _list;
  int get filterBy => _filterBy;

  Future getTask() async {
    List<NewTask> list = await ApiFetcher.gettingTasks();
    _list = list;
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }

  void addingTask(NewTask task) async {
    _list = await ApiFetcher.addTask(task);
    notifyListeners();
  }

  void removeTask(NewTask task) async {
    _list = await ApiFetcher.deleteTask(task.id);
    notifyListeners();
  }

  void updatingTask(NewTask task) async {
    task.toggleCompleted(task);
    _list = await ApiFetcher.updateTask(task.id, task);
    notifyListeners();
  }

  void isCompleted(NewTask task) {
    task.toggleCompleted(task);
    notifyListeners();
  }
}
