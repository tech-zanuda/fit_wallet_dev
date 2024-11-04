import 'package:flutter/material.dart';

enum AppThemeMode { light, system, dark }

class AppThemeModeProvider extends ChangeNotifier {
  AppThemeMode _appThemeMode = AppThemeMode.system;
  get appThemeMode => _appThemeMode;
  ThemeMode _mode = ThemeMode.system;
  get mode => _mode;

  void setAppThemeMode(AppThemeMode newValue) {
    _appThemeMode = newValue;
    switch (_appThemeMode) {
      case AppThemeMode.light:
        _mode = ThemeMode.light;
        notifyListeners();
        break;
      case AppThemeMode.dark:
        _mode = ThemeMode.dark;
        notifyListeners();
        break;
      default:
        _mode = ThemeMode.system;
        notifyListeners();
    }
  }
}
