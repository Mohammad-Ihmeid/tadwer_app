import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/users/domain/usecases/home_data.dart';

class FacilityTypeScreen extends StatelessWidget {
  const FacilityTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 3.h),
          Container(
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
          ),
          SizedBox(height: 3.h),
          Container(
            width: 70.w,
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppBorderRadius.s15),
              color: ColorManager.gray,
            ),
            child: Text(
              "ما نوع منشئتك",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.lightGreen,
                fontSize: 15.sp,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16,
              vertical: AppPadding.p8,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: HomeData.listData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 20.sp,
                              child: Image.asset(
                                HomeData.listData[index].image,
                                width: 10.w,
                                height: 10.h,
                              ),
                            ),
                            if ((HomeData.listData.length - 1) != index)
                              Container(
                                height: 2.h,
                                width: 3.w,
                                color: ColorManager.lightGreen,
                              ),
                          ],
                        ),
                        Text(
                          HomeData.listData[index].name,
                          style: TextStyle(
                            color: ColorManager.lightGreen,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ))
        ],
      )),
    );
  }
}
