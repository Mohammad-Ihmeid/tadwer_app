import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color_manger.dart';

ThemeData getApplecationTheme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "DGAgnadeen",
    scaffoldBackgroundColor: ColorManager.white,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    textTheme: _textTheme(),
  );
}

TextTheme _textTheme() {
  return TextTheme(
      headlineMedium: TextStyle(
        color: ColorManager.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: ColorManager.darkBink,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: ColorManager.white,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
          fontSize: 12.sp,
          color: ColorManager.white,
          fontWeight: FontWeight.w100,
          letterSpacing: 1.2,
          shadows: const [
            Shadow(
                color: ColorManager.darkBink,
                blurRadius: 1,
                offset: Offset(1, 1))
          ],
          decorationThickness: 0.0));
}
