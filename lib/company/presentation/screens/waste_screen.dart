import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/waste_component/waste_type_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/controller/waste_bloc/waste_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class WasteScreen extends StatelessWidget {
  final String categoryName;
  final int catId;
  const WasteScreen({
    super.key,
    required this.categoryName,
    required this.catId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<WasteBloc>()..add(GetWasteByCategoryEvent(catId)),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomAppBar.appBar(context: context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categoryName,
                            style: Theme.of(context).textTheme.headlineMedium,
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
                    SizedBox(height: 1.h),
                    WasteTypeComponent(),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () => Navigator.pushNamed(
                    //             context, Routes.recyclingRequest),
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               IconsAssets.logoApp,
                    //               color: Colors.white,
                    //               width: 20.w,
                    //               height: 10.h,
                    //             ),
                    //             Text(
                    //               "طلب تدوير",
                    //               style:
                    //                   Theme.of(context).textTheme.titleMedium,
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () =>
                    //             Navigator.pushNamed(context, Routes.basket),
                    //         child: Column(
                    //           children: [
                    //             Image.asset(
                    //               ImagesAssets.basketImage,
                    //               width: 20.w,
                    //               height: 10.h,
                    //             ),
                    //             Text(
                    //               "السلة",
                    //               style:
                    //                   Theme.of(context).textTheme.titleMedium,
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
