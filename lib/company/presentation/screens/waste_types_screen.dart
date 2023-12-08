import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';
import 'package:tadwer_app/company/data/models/waste_type_model.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_header.dart';
import 'package:tadwer_app/company/presentation/controller/waste_types_controller.dart';

import '../../../core/constanses.dart';

class WasteTypesScreen extends StatelessWidget {
  const WasteTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 3.h),
                      CustomAppBar.appBar(),
                      SizedBox(height: 3.h),
                      CustomHeader.customHeader(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  AppConstanse().box.read("Image"),
                                  width: 10.w,
                                  height: 10.h,
                                ),
                                Text(AppConstanse().box.read("Name"),
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.w900,
                                        shadows: const [
                                          Shadow(
                                              color: ColorManager.lightGreen,
                                              blurRadius: 1,
                                              offset: Offset(1, 1))
                                        ]))
                              ]),
                          width: 100,
                          paddingVertical: AppPadding.p4),
                      SizedBox(height: 3.h),
                      CustomHeader.customHeader(
                          child: Text(
                            "أنواع المخلفات التي تمتلكها",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                shadows: const [
                                  Shadow(
                                      color: ColorManager.lightGreen,
                                      blurRadius: 1,
                                      offset: Offset(1, 1))
                                ]),
                          ),
                          width: 80,
                          paddingVertical: AppPadding.p16),
                      SizedBox(height: 3.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16,
                        ),
                        child: Consumer<WasteTypeProvider>(
                            builder: (context, provider, child) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.listWasteType.length,
                              itemBuilder: (context, index) {
                                WasteTypeModel item =
                                    provider.listWasteType[index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Checkbox(
                                      value: item.isSelected,
                                      onChanged: (select) => provider.onChanged(
                                        select: select!,
                                        item: item,
                                      ),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      visualDensity:
                                          const VisualDensity(horizontal: -4),
                                      activeColor: ColorManager.lightGreen
                                          .withOpacity(0.7),
                                      checkColor: ColorManager.darkGreen,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppBorderRadius.s5,
                                          ),
                                          side: const BorderSide(
                                              color: ColorManager.darkGreen)),
                                    ),
                                    Text(
                                      item.wasteType,
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                          color: ColorManager.lightGreen,
                                          shadows: const [
                                            Shadow(
                                                color: ColorManager.darkGreen,
                                                blurRadius: 1,
                                                offset: Offset(1, 1))
                                          ]),
                                    ),
                                  ],
                                );
                              });
                        }),
                      ),
                      SizedBox(height: 3.h),
                      Container(
                          height: 7.h,
                          padding: const EdgeInsets.only(
                            right: AppPadding.p16,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p16,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(50, 50)),
                            color: ColorManager.gray,
                          ),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: ColorManager.lightGreen,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w300,
                                    decoration: TextDecoration.none),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorManager.white,
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    gapPadding: 0,
                                    borderRadius: BorderRadius.circular(
                                        AppBorderRadius.s20),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    gapPadding: 0,
                                    borderRadius: BorderRadius.circular(
                                        AppBorderRadius.s20),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                    gapPadding: 0,
                                    borderRadius: BorderRadius.circular(
                                        AppBorderRadius.s20),
                                  ),
                                ),
                              ),
                            )),
                            Text("ملاحظات",
                                style: TextStyle(
                                    color: ColorManager.lightGreen,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    shadows: const [
                                      Shadow(
                                          color: ColorManager.lightGreen,
                                          blurRadius: 1,
                                          offset: Offset(1, 1))
                                    ]))
                          ])),
                      SizedBox(height: 3.h),
                      Center(
                        child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.orderConfirmation),
                            child: Container(
                                width: 60.w,
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppBorderRadius.s15),
                                  color: ColorManager.darkGreen,
                                ),
                                child: Text("طلب تدوير",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        shadows: const [
                                          Shadow(
                                              color: ColorManager.lightGreen,
                                              blurRadius: 1,
                                              offset: Offset(1, 1))
                                        ])))),
                      )
                    ]))));
  }
}
