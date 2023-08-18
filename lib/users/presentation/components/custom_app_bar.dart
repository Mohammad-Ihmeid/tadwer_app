import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manger.dart';
import '../../../core/utils/values_manager.dart';

class CustomAppBar {
  static Widget appBar() {
    return Container(
      margin: EdgeInsets.only(right: 30.w),
      decoration: const BoxDecoration(
        color: ColorManager.gray,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppBorderRadius.s20),
          bottomRight: Radius.circular(AppBorderRadius.s20),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: AppPadding.p16),
          child: Image.asset(
            ImagesAssets.logoNameApp,
            width: 40.w,
            height: 15.h,
            //fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
