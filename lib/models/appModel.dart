import 'package:flutter/material.dart';
import 'package:todolist6/data/dataClasses.dart';

class AppModel extends ChangeNotifier {
  final List<Task> tasks = [];
  List<Category> categories = [
    Category(title: 'Home', color: Colors.greenAccent),
    Category(title: 'Work', color: Colors.lightGreen),
    Category(title: 'Studies', color: Colors.orangeAccent)
  ];
  int isDoneCount = 0;
  Category temporaryCategory = Category(title: 'Home', color: Colors.greenAccent);

  void addTask(String name, String description, Category category) {
    tasks.add(Task(name: name, description: description, category: category));
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void changeDone(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    notifyListeners();
  }
}
