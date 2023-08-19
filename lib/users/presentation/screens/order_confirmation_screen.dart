import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/users/presentation/components/custom_order.dart';
import 'package:tadwer_app/users/presentation/controller/date_controller.dart';

import '../components/custom_header.dart';

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
                //onTap: () => provider.showPicker(context),
                child: Image.asset(IconsAssets.map, width: 10.w)),
            SizedBox(height: 3.h),
            Text(
              "سيتم تقدير كمية المخالفات من قبل المندوب",
              style: TextStyle(
                  color: ColorManager.lightGreen,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w100),
            ),
            CustomHeader.customHeader(
                child: Text("تأكيد الطلب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500)),
                paddingVertical: AppPadding.p16,
                width: 100,
                color: ColorManager.lightGreen),
            SizedBox(height: 6.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                ImagesAssets.logoNameApp,
                width: 80.w,
              ),
            )
          ],
        ),
      )),
    );
  }
}
