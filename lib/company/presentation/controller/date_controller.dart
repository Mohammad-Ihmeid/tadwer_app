import 'package:flutter/material.dart';

import '../components/widget/custom_picker.dart';

class DateController with ChangeNotifier {
  DateTime date = DateTime.now();

  DateController() {
    initializeProvider();
  }

  initializeProvider() {
    date = DateTime.now();
    notifyListeners();
  }

  Future<void> showPicker(context) async {
    date =
        await CustomStatmentsPicker().showPicker(context, date).then((value) {
      if (value == null) {
        return date;
      } else {
        return value;
      }
    });
    notifyListeners();
  }
}
