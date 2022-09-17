import 'package:flutter/material.dart';
import 'package:todo_app/notifiers/DarkThemeProvider.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/Login/LoginForm.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TodoApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeChangeProvider.darkTheme ? ThemeData.dark() : ThemeData.light(),
              home: const LoginForm(),
            );
          },
        ),);
  }
}