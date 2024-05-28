import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/components/custom_text_field.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/unique_key.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                ImagesAssets.logInBackgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(AppPadding.p16),
                  children: [
                    Text(
                      'حساب جديد',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 5,
                        shadows: const [
                          Shadow(
                            color: ColorManager.darkBink,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: name,
                      hintText: "اسم المستخدم",
                      icon: Icons.email,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextField(
                      controller: password,
                      hintText: "كلمة السر",
                      icon: Icons.lock,
                      textInputAction: TextInputAction.next,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    SizedBox(height: 5.h),
                    CustomTextField(
                      controller: confirmPassword,
                      hintText: "تأكيد كلمة السر",
                      icon: Icons.lock,
                      textInputAction: TextInputAction.done,
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    SizedBox(height: 5.h),
                    _signUpButtom(context, name, password, confirmPassword),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpButtom(BuildContext context, TextEditingController name,
      TextEditingController password, TextEditingController confirmPassword) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.signUpState == SignInRequestState.loading) {
          LoadingDialog.show(context, key: UnKey.unKey6);
        }
        if (state.signUpState == SignInRequestState.error) {
          LoadingDialog.hide(context);
          AppConstanse.messageWarning(state.signUpError, context);
        }
        if (state.signUpState == SignInRequestState.success) {
          LoadingDialog.hide(context);
          showCustomSaveDialog(context, "تم تسجيل حساب جديد بنجاح")
              .then((value) => Navigator.pop(context));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<LoginBloc>().add(
                SignUpEvent(
                  userName: name.text,
                  password: password.text,
                  confirmPassword: confirmPassword.text,
                ),
              ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.white),
            ),
            child: Text(
              "التسجيل",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        );
      },
    );
  }
}
