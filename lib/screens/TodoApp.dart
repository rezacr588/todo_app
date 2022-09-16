import 'package:flutter/material.dart';

import '../widgets/Login/Login.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Login(),
    );
  }
}