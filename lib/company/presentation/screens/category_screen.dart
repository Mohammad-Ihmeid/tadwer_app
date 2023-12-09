import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/category_type_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_header.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';

class CategoryScreen extends StatelessWidget {
  final String nameCompany;
  const CategoryScreen({Key? key, required this.nameCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyTypeBloc>()..add(GetAllCategoryEvent()),
      lazy: false,
      child: Scaffold(
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
              children: [
                SizedBox(height: 3.h),
                CustomAppBar.appBar(),
                SizedBox(height: 3.h),
                CustomHeader.customHeader(
                    child: Text(
                  nameCompany,
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
                SizedBox(height: 5.h),
                const CategoryTypeComponent(),
              ],
            )
          ],
        )),
      ),
    );
  }
}
