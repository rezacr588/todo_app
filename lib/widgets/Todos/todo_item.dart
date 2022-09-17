// The TodoItem is a single representation for each todo item in our list
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo_model.dart';

import '../../provider/todo_provider.dart';

class TodoItem extends StatelessWidget {
  TodoItem({ required this.index }) : super(key: ObjectKey(index));
  
  // store index of the todo item
  final int index;

  // Get style of the todo item based on its status (done or pending)
  TextStyle? _getTextStyle(Status status) {

    // Todo item is pending and not done yet so return a normal text style for it
    if (status.type == Status.pending.type) {
      return const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );
    } else {
      // Todo item is done so return a line-through text style for it
      return const TextStyle(
        color: Colors.grey,
        decoration: TextDecoration.lineThrough,
      );
    }
  }

  // Builder of todo widget item to display in the list tile
  @override
  Widget build(BuildContext context) {

    // Get the todo provider from the context
    final task = Provider.of<TodoProvider>(context);

    // Get the todo item from the list of todo items in the state
    final todo = task.allTasks[index];
    // choose the right icon based on the status of the todo item
    Icon icon = Icon(todo.status.type == Status.pending.type ? Icons.circle_outlined : Icons.task_alt_outlined);

    return ListTile(
      onTap: () {
        // onTodoShow(todo);
      },
      leading: IconButton(iconSize: 32 ,icon: icon, onPressed: () { task.toggleTask(todo); },),
      title: Text(todo.title, style: _getTextStyle(todo.status)),
      subtitle: todo.description != null ? Text(
        todo.description?.toString() ?? '',
      ) : null,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          task.deleteTask(todo);
        },
      ),
    );
  }
}

