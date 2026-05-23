import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager extends ChangeNotifier {
  final SharedPreferences _prefs;
  static const String _key = 'is_dark_mode';

  ThemeManager(this._prefs) {
    _isDarkMode = _prefs.getBool(_key) ?? false;
  }

  bool _isDarkMode = false;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _prefs.setBool(_key, _isDarkMode);
    notifyListeners();
  }
}
