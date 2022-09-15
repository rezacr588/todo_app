// The TodoItem is a single representation for each todo item in our list
import 'package:flutter/material.dart';

import 'Todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
  }) : super(key: ObjectKey(todo));

  // The todo object to display in this widget instance (passed in from the parent)
  final Todo todo;

  // The callback function to update the todo item in the list when the checkbox is checked or unchecked
  final onTodoChanged;

  // Get style of the todo item based on its status (done or pending)
  TextStyle? _getTextStyle(Status status) {

    // Todo item is pending and not done yet so return a normal text style for it
    if (status == Status.pending) {
      return const TextStyle(
        color: Colors.green,
      );
    }
    // Todo item is done so return a line-through text style for it
    return const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.lineThrough,
    );
  }
  // Template of todo widget item to display in the list tile
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.title[0]),
      ),
      title: Text(todo.title, style: _getTextStyle(todo.status)),
    );
  }
}

