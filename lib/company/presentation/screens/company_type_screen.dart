import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/company_type_component.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';

import 'package:tadwer_app/core/utils/color_manger.dart';

import '../components/widget/custom_app_bar.dart';

class CompanyTypeScreen extends StatelessWidget {
  const CompanyTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CompanyTypeBloc>()..add(GetAllCompanyTypeEvent()),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar.appBar(context: context, showBackIcon: false),
                  Text(
                    " ما نوع منشئتك ؟",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      shadows: const [
                        Shadow(
                          color: ColorManager.lightGreen,
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  const CompanyTypeComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
