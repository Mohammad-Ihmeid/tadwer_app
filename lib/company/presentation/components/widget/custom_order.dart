import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/color_manger.dart';
import '../../../../core/utils/values_manager.dart';

class CustomOrder {
  static Widget rowButton({
    Function()? onTap,
    Widget? child,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppBorderRadius.s5),
                color: ColorManager.lightGreen),
            child: child,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorManager.lightGreen,
              fontSize: 12.sp,
              fontWeight: FontWeight.w900,
              shadows: const [
                Shadow(
                    color: ColorManager.darkGreen,
                    blurRadius: 0.3,
                    offset: Offset(1, 0.5))
              ]),
        ),
      ],
    );
  }
}
