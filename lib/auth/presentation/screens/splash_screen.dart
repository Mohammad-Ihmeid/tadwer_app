import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/auth/presentation/controller/login_bloc/login_bloc.dart';
import 'package:tadwer_app/company/presentation/screens/category_screen.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/enums.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/global/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>()..add(SplashCheckLogInEvent()),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.requestSplashState == RequestState.error) {
              Future.delayed(const Duration(seconds: 5));
              Navigator.pushReplacementNamed(context, Routes.logIn);
            } else if (state.requestSplashState == RequestState.loaded) {
              Future.delayed(const Duration(seconds: 5));
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
          child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(
                ImagesAssets.splashImage,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
