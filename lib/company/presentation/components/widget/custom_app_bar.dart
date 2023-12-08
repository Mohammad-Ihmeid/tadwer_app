import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';

import '../../../../core/utils/assets_manager.dart';

class CustomAppBar {
  static Widget appBar() {
    return Center(
      child: Image.asset(
        ImagesAssets.logoNameApp,
        color: ColorManager.white,
        width: 50.w,
      ),
    );
  }
}
