import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/components/custom_text_field.dart';
import 'package:tadwer_app/auth/presentation/controller/login_controller.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightGreen,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    decoration: const BoxDecoration(
                      color: ColorManager.darkGreen,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(IconsAssets.userIcon,
                        width: 12.w, height: 12.h)),
                SizedBox(height: 2.h),
                Text(
                  'CUSTOMER LOGIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 5,
                  ),
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: "Email ID",
                  icon: Icons.email,
                  suffixIcon: const SizedBox.shrink(),
                ),
                SizedBox(height: 2.h),
                CustomTextField(
                  controller: TextEditingController(),
                  hintText: "Password",
                  icon: Icons.lock,
                  suffixIcon: const SizedBox.shrink(),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Consumer<LogInProvider>(
                          builder: (context, provider, child) {
                            return Checkbox(
                              value: provider.checkbox,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity:
                                  const VisualDensity(horizontal: -4),
                              onChanged: (check) =>
                                  provider.changeCheckbox(check!),
                              side: const BorderSide(color: ColorManager.white),
                              activeColor: ColorManager.darkGreen,
                            );
                          },
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Remember me",
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ],
                ),
                SizedBox(height: 3.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p8,
                    ),
                    color: ColorManager.darkGreen,
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
