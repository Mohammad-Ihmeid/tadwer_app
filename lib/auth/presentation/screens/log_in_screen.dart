import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/components/custom_text_field.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/unique_key.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.requestState == SignInRequestState.loading) {
              LoadingDialog.show(context, key: UnKey.unKey1);
            }
            if (state.requestState == SignInRequestState.error) {
              LoadingDialog.hide(context);
              AppConstanse.messageWarning(state.errorMessage, context);
            } else if (state.requestState == SignInRequestState.success) {
              LoadingDialog.hide(context);
              // if (state.user!.compRef == 0) {
              //   Navigator.pushReplacementNamed(context, Routes.companyType);
              // } else {
              Navigator.pushReplacementNamed(context, Routes.categoryType);
              // }
            }
          },
          child: Stack(
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
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: _logInForm(name, password, context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logInForm(TextEditingController name, TextEditingController password,
      BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'تسجيل الدخول',
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
                      offset: Offset(1, 1))
                ]),
          ),
          SizedBox(height: 5.h),
          CustomTextField(
            controller: name,
            hintText: "اسم المستخدم",
            icon: Icons.email,
            suffixIcon: const SizedBox.shrink(),
            validator: (value) {
              if (value == "") {
                return "الرجاء أدخال أسم المستخدم";
              }
              return null;
            },
          ),
          SizedBox(height: 2.h),
          CustomTextField(
            controller: password,
            hintText: "كلمة السر",
            icon: Icons.lock,
            textInputAction: TextInputAction.done,
            suffixIcon: const SizedBox.shrink(),
            validator: (value) {
              if (value == "") {
                return "الرجاء أدخال كلمة السر";
              }
              return null;
            },
          ),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.signUp),
            child: Row(
              children: [
                Text(
                  'أنشاء حساب جديد',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(width: 2.w),
                const Icon(
                  Icons.arrow_forward,
                  color: ColorManager.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          _logInButtom(context, name, password),
        ],
      ),
    );
  }

  Widget _logInButtom(BuildContext context, TextEditingController name,
      TextEditingController password) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(
                  CheckLogInEvent(name: name.text, password: password.text));
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
            ),
            decoration:
                BoxDecoration(border: Border.all(color: ColorManager.white)),
            child: Text(
              "الدخول",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        );
      },
    );
  }
}
