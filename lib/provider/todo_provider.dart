import 'package:flutter/material.dart';
import 'dart:collection';
import 'package:todo_app/model/todo_model.dart';

class TodoProvider with ChangeNotifier {

  //you can put one or two dummy task
  final List<TodoModel> _tasks = [];

  //to get all the tasks
  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);

  //all new added task must on pending status
  void addTask(String task) {
    _tasks.add(TodoModel(title: task, description: "", status: Status.pending));
    notifyListeners();
  }

  // update todo details by id
  void updateTask(int id,String title, String description) {
    var task = _tasks[id];
    task.title = title;
    task.description = description;
    _tasks[id] = task;
    notifyListeners();
  }

  //we are not working with task id that why we are working with every tasks index number to modify
  void toggleTask(TodoModel task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].handleTodoChange();
    notifyListeners();
  }

  // get a task by index
  TodoModel getTask(int index) {
    return _tasks[index];
  }

  //to delete a task
  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }

}