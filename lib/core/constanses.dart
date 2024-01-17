import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class AppConstanse {
  static const String baseURL = "";

  GetStorage box = GetStorage();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      messageWarning(String title, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.s15)),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        content: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
