import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

Future<dynamic> showCustomSaveDialog(BuildContext context, String title) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: ColorManager.white,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorManager.darkBink,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorManager.darkBink,
              borderRadius: BorderRadius.circular(AppBorderRadius.s5),
              border: Border.all(
                color: ColorManager.black,
              ),
            ),
            child: Text(
              "موافق",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    ),
  );
}
