import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/todo_screen.dart';
import 'package:todo_app/widgets/Todos/todo_list.dart';

// TodoList is a StatefulWidget, which means it can change its state.
class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  TodosScreenState createState() => TodosScreenState();
}

// TodoList is a StatefulWidget, which means it can change its state.
class TodosScreenState extends State<TodosScreen> {

  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  // the widget template
  @override
  Widget build(BuildContext context) {
    // turn back to login screen on clicking back button  on the appbar of the screen
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: WillPopScope(
        child: const TodoList(),
        onWillPop: () async {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
          return true;
        },
      ) ,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(),
          tooltip: 'Add Item',
          child: const Icon(Icons.add)),
    ) ;
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
                _submit();
              },
            ),
          ],
        );
      },
    );
  }
}