import 'package:flutter/material.dart';

import 'color_manger.dart';

ThemeData getApplecationTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "DGAgnadeen",
    scaffoldBackgroundColor: ColorManager.lightGreen,
    textTheme: const TextTheme(
        // headlineLarge: TextStyle(
        //     fontSize: 12.sp,
        //     color: ColorManager.primaryNavyBlue,
        //     fontWeight: FontWeight.w700),
        // headlineMedium: const TextStyle(
        //   color: ColorManager.white,
        // ),
        // titleLarge: TextStyle(
        //     fontSize: 10.sp,
        //     color: ColorManager.primaryNavyBlue,
        //     fontWeight: FontWeight.w500,
        //     decorationThickness: 0.0),
        // titleMedium: TextStyle(
        //     fontSize: 10.sp,
        //     color: ColorManager.primary,
        //     fontWeight: FontWeight.w400,
        //     decorationThickness: 0.0),
        // displayMedium: TextStyle(
        //     fontSize: 12.sp,
        //     color: ColorManager.primary,
        //     fontWeight: FontWeight.w600,
        //     decorationThickness: 0.0),
        // displaySmall: TextStyle(
        // fontSize: 12.sp,
        // color: ColorManager.black,
        // fontWeight: FontWeight.w500,
        // decorationThickness: 0.0)
        ),
  );
}
