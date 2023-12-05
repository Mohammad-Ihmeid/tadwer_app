import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/color_manger.dart';
import '../../../core/utils/values_manager.dart';

class CustomHeader {
  static Widget customHeader({
    required Widget child,
    double width = 70,
    double paddingVertical = AppPadding.p8,
    double paddingHorizontal = AppPadding.p8,
    Color color = ColorManager.gray,
  }) {
    return Container(
      width: 60.w,
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p8, horizontal: AppPadding.p16),
      decoration: const BoxDecoration(
        color: ColorManager.darkGreen,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppBorderRadius.s20),
          bottomRight: Radius.circular(AppBorderRadius.s20),
        ),
      ),
      child: child,
    );
  }
}
