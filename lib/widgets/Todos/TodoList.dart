import 'package:flutter/material.dart';
import 'package:todo_app/widgets/Todos/TodoItem.dart';

import 'Todo.dart';

// TodoList is a StatefulWidget, which means it can change its state.
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  _TodoListState createState() => _TodoListState();
}

// TodoList is a StatefulWidget, which means it can change its state.
class _TodoListState extends State<TodoList> {

  // Text editing controller for the text field.
  final TextEditingController _textFieldController = TextEditingController();

  // A list of strings to store the todo items
  final List<Todo> _todos = <Todo>[];

  // the widget template
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _todos.length,
        itemBuilder: (BuildContext _, int index) {
          final Todo todo = _todos[index];
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add Item',
        child: const Icon(Icons.add)),
    );
  }

  // Function to display the dialog box to add a new todo item to the list of todo items in the state
  Future<void> _displayDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new todo item'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Type your new todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
          ],
        );
      },
    );
  }

  // Function to add a new todo item to the list of todo items in the state
  void _addTodoItem(String title) {
    setState(() {
      _todos.add(Todo(title: title, status: Status("Pending" ))); // add the item to the list of todo items
    });
    _textFieldController.clear(); // clear the text field
  }

  // Function to update the status of a todo item in the list of todo items in the state
  void _handleTodoChange(Todo todo) {
    setState(() {
      if (todo.status.type == Status.pending.type) {
        todo.status.type = "Done";
      } else {
        todo.status.type = "Pending";
      }
    });
  }
}