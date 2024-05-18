import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

import '../../../../core/utils/assets_manager.dart';

class CustomAppBar {
  static Widget appBar(
      {required BuildContext context, bool showBackIcon = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.userInfo),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ColorManager.white),
                color: Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  Icons.person_outline_rounded,
                  color: ColorManager.white,
                  size: 30.sp,
                ),
              ),
            ),
          ),
          Image.asset(
            ImagesAssets.logoNameApp,
            color: ColorManager.white,
            width: 50.w,
          ),
          showBackIcon
              ? GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.basket),
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.shopping_basket_outlined,
                        color: ColorManager.white,
                        size: 35.sp,
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.transparent,
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.transparent,
                      size: 25.sp,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
