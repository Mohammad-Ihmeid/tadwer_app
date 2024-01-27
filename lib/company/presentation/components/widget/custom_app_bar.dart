import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_dialog.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

import '../../../../core/utils/assets_manager.dart';

class CustomAppBar {
  static Widget appBar(
      {required BuildContext context, bool showBackIcon = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16, vertical: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showBackIcon
              ? GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.white,
                        size: 25.sp,
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.transparent,
                      size: 25.sp,
                    ),
                  ),
                ),
          Image.asset(
            ImagesAssets.logoNameApp,
            color: ColorManager.white,
            width: 50.w,
          ),
          GestureDetector(
            onTap: () => showCustomDialog(context),
            child: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.transparent,
              child: Center(
                child: Icon(
                  Icons.logout,
                  color: ColorManager.white,
                  size: 25.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
