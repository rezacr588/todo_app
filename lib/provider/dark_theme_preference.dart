import 'package:shared_preferences/shared_preferences.dart';

// This class is used to store the current theme status.
class DarkThemePreference {
  static const themeStatus = "THEME_STATUS";

  // This method is used to set the current theme status in memory.
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  // This method is used to get the current theme status from memory.
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}