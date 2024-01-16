import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_address_text_field.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_recycling_request/recycling_request_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

Future<dynamic> showAddAddressDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p16,
        ),
        padding: const EdgeInsets.all(AppPadding.p8),
        decoration: BoxDecoration(
          color: ColorManager.gray,
          borderRadius: BorderRadius.circular(AppBorderRadius.s15),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocProvider(
            create: (context) => getIt<RecyclingRequestBloc>(),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          color: Colors.transparent,
                          child: Icon(
                            Icons.close,
                            color: ColorManager.error,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "المحافظة",
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "المنطقة",
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "الشارع",
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "رقم الهاتف",
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "رقم البناية",
                    ),
                    SizedBox(height: 1.h),
                    CustomAddressTextField(
                      controller: TextEditingController(),
                      hintText: "معلومات أضافية",
                    ),
                    SizedBox(height: 1.h),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorManager.darkBink),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 10)),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(AppPadding.p8)),
                      ),
                      child: Text(
                        "حفظ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
