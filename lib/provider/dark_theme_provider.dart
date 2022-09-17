import 'package:flutter/foundation.dart';
import 'package:todo_app/provider/dark_theme_preference.dart';

// This class is used to store the current theme status.
class DarkThemeProvider with ChangeNotifier {
  // This class is used to store the current theme status.
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  // This method is used to set the current theme status.
  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}