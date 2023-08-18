import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/users/domain/usecases/home_data.dart';
import 'package:tadwer_app/users/presentation/components/custom_app_bar.dart';
import 'package:tadwer_app/users/presentation/components/custom_header.dart';

class FacilityTypeScreen extends StatelessWidget {
  const FacilityTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 3.h),
          CustomAppBar.appBar(),
          SizedBox(height: 3.h),
          CustomHeader.customHeader(
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
                    onTap: () => Get.toNamed(Routes.wasteType, arguments: {
                      "Name": HomeData.listData[index].name,
                      "Image": HomeData.listData[index].image
                    }),
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
