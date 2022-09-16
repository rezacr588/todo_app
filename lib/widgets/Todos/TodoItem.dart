// The TodoItem is a single representation for each todo item in our list
import 'package:flutter/material.dart';

import 'Todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem({
    required this.todo,
    required this.onTodoChanged,
    required this.onTodoDeleted,
  }) : super(key: ObjectKey(todo));

  // The todo object to display in this widget instance (passed in from the parent)
  final Todo todo;

  // The callback function to update the todo item in the list when the checkbox is checked or unchecked
  final onTodoChanged;

  // The callback function to remove the todo item in the list when the delete button is pressed
  final onTodoDeleted;

  // Get style of the todo item based on its status (done or pending)
  TextStyle? _getTextStyle(Status status) {

    // Todo item is pending and not done yet so return a normal text style for it
    if (status.type == Status.pending.type) {
      return const TextStyle(
        color: Colors.black,
      );
    } else {
      // Todo item is done so return a line-through text style for it
      return const TextStyle(
        color: Colors.grey,
        decoration: TextDecoration.lineThrough,
      );
    }
  }

  // Template of todo widget item to display in the list tile
  @override
  Widget build(BuildContext context) {
    Icon icon = Icon(todo.status.type == Status.pending.type ? Icons.circle_outlined : Icons.task_alt_outlined);
    return ListTile(
      onTap: () {
        // onTodoChanged(todo);
      },
      leading: IconButton(iconSize: 32 ,icon: icon, onPressed: () { onTodoChanged(todo); },),

      title: Text(todo.title, style: _getTextStyle(todo.status)),
      subtitle: todo.description != null ? Text(
        todo.description?.toString() ?? '',
      ) : null,
    );
  }
}

