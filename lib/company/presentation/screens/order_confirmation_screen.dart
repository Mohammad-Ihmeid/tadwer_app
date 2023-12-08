import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_order.dart';
import 'package:tadwer_app/company/presentation/controller/date_controller.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<DateController>(builder: (context, provider, child) {
              return CustomOrder.rowButton(
                  title: "جدولة المواعيد",
                  onTap: () => provider.showPicker(context),
                  child: Column(children: [
                    Image.asset(
                      IconsAssets.calendar,
                      width: 10.w,
                    ),
                    Container(
                        width: 10.w,
                        height: 4.h,
                        color: ColorManager.white,
                        child: Center(
                            child: Text(provider.date.day.toString(),
                                style: TextStyle(
                                    color: ColorManager.lightGreen,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w900))))
                  ]));
            }),
            SizedBox(height: 3.h),
            CustomOrder.rowButton(
                title: "موقع الاستلام",
                onTap: () => Get.offNamed(Routes.locationUsers),
                child: Image.asset(IconsAssets.map, width: 10.w)),
            SizedBox(height: 3.h),
            Text(
              "سيتم تقدير كمية المخلفات من قبل المندوب",
              style: TextStyle(
                  color: ColorManager.lightGreen,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w100,
                  shadows: const [
                    Shadow(
                      color: ColorManager.darkGreen,
                      blurRadius: 1,
                    )
                  ]),
            ),
            Container(
              width: 60.w,
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppBorderRadius.s15),
                color: ColorManager.darkGreen,
              ),
              child: Text("تأكيد الطلب",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      shadows: const [
                        Shadow(
                            color: ColorManager.lightGreen,
                            blurRadius: 1,
                            offset: Offset(1, 1))
                      ])),
            ),
            SizedBox(height: 6.h),
            Image.asset(
              ImagesAssets.logoNameApp,
              width: 60.w,
            )
          ],
        ),
      )),
    );
  }
}
