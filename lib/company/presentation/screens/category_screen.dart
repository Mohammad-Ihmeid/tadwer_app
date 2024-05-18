import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/category_type_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyTypeBloc>()
        ..add(GetAllCategoryEvent())
        ..add(GetCompanyTypeByIdEvent()),
      lazy: false,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomAppBar.appBar(context: context, showBackIcon: true),
                  // BlocBuilder<CompanyTypeBloc, CompanyTypeState>(
                  //   builder: (context, state) {
                  //     return CustomHeader.customHeader(
                  //       child: Text(
                  //         state.companyName,
                  //         style: Theme.of(context).textTheme.headlineMedium,
                  //       ),
                  //     );
                  //   },
                  // ),
                  SizedBox(height: 5.h),
                  const CategoryTypeComponent(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
