import 'package:flutter/material.dart';

import '../../../core/utils/color_manger.dart';

class CustomStatmentsPicker {
  Future<DateTime?> showPicker(context, dateTime) async {
    return dateTime = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                textTheme: const TextTheme(),
                colorScheme: const ColorScheme.light(
                    primary: ColorManager.lightGreen,
                    onPrimary: ColorManager.white,
                    onSurface: Colors.black),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: ColorManager.lightGreen))),
            child: child!,
          );
        },
        context: context,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: dateTime,
        firstDate: DateTime(2010),
        lastDate: DateTime(2100));
  }
}
