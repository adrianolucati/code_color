import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDartTheme = false;
  Color color = Colors.green;

  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }

  changeColorTheme(Color color) {
    this.color = color;
    notifyListeners();
  }
}
