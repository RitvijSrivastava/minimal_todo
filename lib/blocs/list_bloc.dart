import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minimal_todo/database/database.dart';
import 'package:minimal_todo/models/task.dart';

class ListBloc extends ChangeNotifier {
  final db = TaskDatabase();

  List<Task> _taskList = [];

  init() async {
    var tempList = await db.fetchAll();
    _taskList = tempList;
    notifyListeners();
  }

  List<Task> get tasks => _taskList;

  add(String task) async {
    if (task.length != 0) {
      Task tempTask = new Task(task: task);
      await db.addTask(tempTask);
      init();
      notifyListeners();
      print(_taskList);
    }
  }

  deleteAt(int id) async {
    await db.removeTask(id);
    init();
    notifyListeners();
  }
}
