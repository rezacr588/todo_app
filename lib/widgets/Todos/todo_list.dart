import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/widgets/Todos/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: (BuildContext _, int index) {
        return TodoItem(index: index);
      },
    );
  }
}