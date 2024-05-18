import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/basket_component/data_basket_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_header.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_basket/basket_bloc.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BasketBloc>()..add(GetDataBasketEvent()),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.asset(
                ImagesAssets.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p16,
                        vertical: AppPadding.p30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, Routes.userInfo),
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
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: ColorManager.white,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomHeader.customHeader(
                      child: Text(
                        "السلة",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    const DataBasketComponent(),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, Routes.recyclingRequest),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15),
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppMargin.m30,
                            vertical: AppMargin.m8,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p8),
                          child: Text(
                            "طلب تدوير",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
