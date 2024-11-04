import 'package:flutter/material.dart';

class ThemeUltilities with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkmode) {
    _themeMode = isDarkmode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
