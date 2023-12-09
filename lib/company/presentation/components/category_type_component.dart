import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class CategoryTypeComponent extends StatelessWidget {
  const CategoryTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyTypeBloc, CompanyTypeState>(
      builder: (context, state) {
        switch (state.requestStateCategory) {
          case RequestState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorManager.white,
                )));
          case RequestState.error:
            return Column(
              children: [
                Image.asset(
                  IconsAssets.errorImage,
                  width: 10.w,
                  height: 10.h,
                ),
                Text(
                  "حدث خطأ أثناء أحضار البيانات الرجاء أعادة المحاولة لاحقا",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            );
          case RequestState.loaded:
            if (state.categoryType.isEmpty) {
              return Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        IconsAssets.errorImage,
                        width: 10.w,
                        height: 10.h,
                      ),
                      Text(
                        "لا يوجد تصنيفات",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.categoryType.length,
                  itemBuilder: (context, index) {
                    final element = state.categoryType[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppMargin.m30,
                        vertical: AppMargin.m8,
                      ),
                      decoration: BoxDecoration(
                          color: ColorManager.darkBink,
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.s15)),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: AppPadding.p4),
                        child: Center(
                          child: Text(
                            element.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    );
                  });
            }
        }
      },
    );
  }
}
