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
      width: width.w,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadius.s15),
        color: color,
      ),
      child: child,
    );
  }
}
