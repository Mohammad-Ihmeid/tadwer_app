import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/color_manger.dart';
import '../../../core/utils/values_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    //Get.offNamed(Routes.logIn);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    // EasyLoading.instance
    //   ..indicatorType = EasyLoadingIndicatorType.fadingFour
    //   ..loadingStyle = EasyLoadingStyle.custom
    //   ..indicatorSize = 45.0
    //   ..radius = 10.0
    //   ..progressColor = Colors.transparent
    //   ..backgroundColor = ColorManager.primary
    //   ..indicatorColor = ColorManager.white
    //   ..textColor = ColorManager.white
    //   ..maskColor = Colors.transparent
    //   ..userInteractions = true
    //   ..dismissOnTap = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: Image.asset(ImagesAssets.logoApp),
      )),
      bottomSheet: const Padding(
        padding: EdgeInsets.only(bottom: AppPadding.p16),
        child: CircularProgressIndicator(
            color: ColorManager.lightGreen,
            backgroundColor: ColorManager.darkGreen),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
