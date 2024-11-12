import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, system, dark }

class AppThemeModeProvider extends ChangeNotifier {
  AppThemeModeProvider() {
    _initPrefs();
  }

  late SharedPreferences prefs;

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('AppThemeMode', 'system');
  }

  ThemeMode _mode = ThemeMode.system;
  get mode => _mode;

  String? get appThemeMode => prefs.getString('AppThemeMode');

  void setAppThemeMode(String newValue) {
    prefs.setString('AppThemeMode', newValue);
    switch (appThemeMode) {
      case 'light':
        _mode = ThemeMode.light;
        notifyListeners();
        break;
      case 'dark':
        _mode = ThemeMode.dark;
        notifyListeners();
        break;
      default:
        _mode = ThemeMode.system;
        notifyListeners();
    }
  }
}
