import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';

class ShowLoadingWidget extends StatelessWidget {
  const ShowLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 8.h,
          width: 13.w,
          child: const CircularProgressIndicator(
            color: ColorManager.darkBink,
            backgroundColor: ColorManager.gray,
            strokeWidth: 6,
          ),
        ),
      ),
    );
  }
}
