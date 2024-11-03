import 'package:flutter/material.dart';

class CurrentPageProvider extends ChangeNotifier {
  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  void setValue(int newValue) {
    _currentPageIndex = newValue;
    notifyListeners();
  }
}
