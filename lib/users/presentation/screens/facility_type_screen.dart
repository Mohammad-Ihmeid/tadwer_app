import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:tadwer_app/core/utils/color_manger.dart';

import '../../../core/constanses.dart';
import '../../../core/utils/routes/app_routes.dart';
import '../../../core/utils/values_manager.dart';
import '../../domain/usecases/home_data.dart';
import '../components/custom_app_bar.dart';
import '../components/custom_header.dart';

class FacilityTypeScreen extends StatelessWidget {
  const FacilityTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            CustomAppBar.appBar(),
            SizedBox(height: 3.h),
            CustomHeader.customHeader(
              child: Text(
                "ما نوع منشئتك",
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      Shadow(
                          color: ColorManager.lightGreen,
                          blurRadius: 1,
                          offset: Offset(1, 1))
                    ]),
              ),
            ),
            SizedBox(height: 3.h),
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
                        onTap: () {
                          AppConstanse()
                              .box
                              .write("Name", HomeData.listData[index].name);
                          AppConstanse()
                              .box
                              .write("Image", HomeData.listData[index].image);
                          Get.toNamed(Routes.wasteType);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(right: AppPadding.p8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightGreen,
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.elliptical(50, 50),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 20.sp,
                                    backgroundColor: ColorManager.lightGreen,
                                    child: Image.asset(
                                      HomeData.listData[index].image,
                                      width: 10.w,
                                      height: 10.h,
                                    ),
                                  ),
                                  Text(
                                    HomeData.listData[index].name,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: ColorManager.lightGreen,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w100,
                                        shadows: const [
                                          Shadow(
                                              color: ColorManager.darkGreen,
                                              blurRadius: 1,
                                              offset: Offset(1, 1))
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            if ((HomeData.listData.length - 1) != index)
                              Container(
                                margin: EdgeInsets.only(left: 5.5.w),
                                height: 2.h,
                                width: 3.w,
                                color: ColorManager.lightGreen,
                              ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
