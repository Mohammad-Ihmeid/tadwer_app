import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/assets_manager.dart';

class CustomAppBar {
  static Widget appBar() {
    return Center(
      child: Image.asset(
        ImagesAssets.logoNameApp,
        width: 50.w,
      ),
    );
  }
}
