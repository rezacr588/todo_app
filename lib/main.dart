import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/login_screen.dart';
import 'package:todo_app/screens/todos_screen.dart';
import '../provider/dark_theme_provider.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<TodoApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  // Get the current saved app theme.
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
        ChangeNotifierProvider(create: (_) => TodoProvider())
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeChangeProvider.darkTheme ? ThemeData.dark() : ThemeData.light(),
            home: const LoginScreen(),
            routes: {
              '/login': (context) => const LoginScreen(),
              '/todo': (context) => const TodoScreen(),
            },
          );
        },
      ),);
  }
}