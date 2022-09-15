// todo item class for the Todo List
import 'package:flutter/scheduler.dart';

class Todo {
  // The todo item's title
  final String title;

  // The todo item's description
  final String? description;

  // The todo item's due date
  final DateTime? dueData;

  // The todo item's status
  final Status status;

  // Constructor for the Todo Item
  const Todo({
    required this.title,
    this.description,
    this.dueData,
    required this.status,
  });
}

class Status {
  // The status of the todo item
  String type;

  // Constructor for the Status
  Status(this.type);

  // The status of the todo item
  static Status done = Status('Done');
  static Status pending = Status('Pending');
}