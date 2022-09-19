import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/todo_args.dart';
import 'package:todo_app/screens/todos_screen.dart';

import '../model/todo_model.dart';

class TodoScreen extends StatefulWidget {
  // todo screen for getting id of the todo
  const TodoScreen({super.key});

  @override
  TodoState createState() {
    return TodoState();
  }
}

class TodoState extends State<TodoScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  late String title = '';
  late String description = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above
    final args = ModalRoute.of(context)!.settings.arguments as TodoArgs;
    final todoProvider = Provider.of<TodoProvider>(context);


    // return todo by id from the list of todos in the state
    final TodoModel todo = todoProvider.allTasks[args.id];

    return WillPopScope(child: Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo Details"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the title';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                        hintText: 'Enter the title of the todo'),
                    initialValue: todo.title
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 20),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        hintText: 'Description of the todo'),
                    initialValue: todo.description
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      todoProvider.updateTask(
                          args.id,
                          title != '' ? title : todo.title,
                          description != '' ? description : todo.description
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const TodosScreen()));
                    }
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      )
      ,
    ), onWillPop: () async {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const TodosScreen()));
      return false;
    });
  }
}
