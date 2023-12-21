import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/components/custom_text_field.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:tadwer_app/company/presentation/screens/category_screen.dart';
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
        body: SafeArea(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.requestState == SignInRequestState.error) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              } else if (state.requestState == SignInRequestState.success) {
                if (state.user!.compRef == 0) {
                  Navigator.pushReplacementNamed(context, Routes.companyType);
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CategoryScreen(nameCompany: "Mohammad"),
                    ),
                  );
                }
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    if (state.requestState == SignInRequestState.loading)
                      Container(
                        color: Colors.transparent,
                        child: Center(
                          child: SizedBox(
                              height: 10.h,
                              width: 20.w,
                              child: const CircularProgressIndicator()),
                        ),
                      ),
                    SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Image.asset(
                        ImagesAssets.logInBackgroundImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: _logInForm(name, password, context),
                      ),
                    ),
                  ],
                );
              },
            ),
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
            'CUSTOMER LOGIN',
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
            hintText: "Email ID",
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
            hintText: "Password",
            icon: Icons.lock,
            suffixIcon: const SizedBox.shrink(),
            validator: (value) {
              if (value == "") {
                return "الرجاء أدخال كلمة السر";
              }
              return null;
            },
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(horizontal: -4),
                    onChanged: (check) => false,
                    side: const BorderSide(color: ColorManager.white),
                    activeColor: ColorManager.darkBink,
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
              color: ColorManager.black,
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
