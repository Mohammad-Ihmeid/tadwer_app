import 'package:flutter/material.dart';

class LogInProvider with ChangeNotifier {
  bool checkbox = false;

  LogInProvider() {
    initializeProvider();
  }

  initializeProvider() {
    checkbox = false;
  }

  changeCheckbox(bool check) {
    checkbox = check;
    notifyListeners();
  }
}
