import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/components/user_data_component.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_dialog.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>()..add(const GetUserInfoEvent()),
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p16,
                  horizontal: AppPadding.p24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => showCustomDialog(context),
                          child: Image.asset(
                            IconsAssets.logout,
                            color: ColorManager.white,
                            width: 10.w,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
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
                                  size: 60.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "بيانات المستخدم",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                        GestureDetector(
                          //onTap: () => showCustomDialog(context),
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.white,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    const UserDataComponent(),
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
