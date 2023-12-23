import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';

Future<dynamic> showCustomDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: ColorManager.white,
      content: Text(
        "هل أنت متأكد من تسجيل الخروج ؟",
        textAlign: TextAlign.right,
        style: TextStyle(
          color: ColorManager.darkBink,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.transparent,
            child: Text(
              'لا',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            remove();

            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.logIn,
              (route) => false,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.transparent,
            child: Text(
              'نعم',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        )
      ],
    ),
  );
}

void remove() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove("UserName");
  await prefs.remove("Password");
  await prefs.remove("Uid");
  await prefs.remove("CompRef");
  await prefs.remove("IsAdmin");
}
