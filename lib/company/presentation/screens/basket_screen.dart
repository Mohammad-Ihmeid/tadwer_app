import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_header.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            width: 100.w,
            height: 100.h,
            child: Image.asset(
              ImagesAssets.backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar.appBar(context),
              CustomHeader.customHeader(
                child: Text(
                  "السلة",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ],
      )),
    );
  }
}
