import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class CompanyTypeComponent extends StatelessWidget {
  const CompanyTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyTypeBloc, CompanyTypeState>(
      buildWhen: (previous, current) =>
          previous.companyTypeRequestState != current.companyTypeRequestState,
      builder: (context, state) {
        switch (state.companyTypeRequestState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.white,
                ),
              ),
            );
          case RequestState.error:
            return Column(
              children: [
                Image.asset(
                  IconsAssets.userIcon,
                  width: 10.w,
                  height: 10.h,
                ),
                const Text(
                    "حدث خطأ أثناء أحضار البيانات الرجاء أعادة المحاولة لاحقا")
              ],
            );
          case RequestState.loaded:
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p8,
                ),
                child: BlocConsumer<CompanyTypeBloc, CompanyTypeState>(
                  listener: (context, state) {
                    if (state.connectCompanyState == BottomState.success) {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.categoryType,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.connectCompanyState == BottomState.loading) {
                      return const SizedBox(
                        height: 170.0,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.white,
                          ),
                        ),
                      );
                    } else {
                      return listCompanyType(context, state);
                    }
                  },
                ),
              ),
            );
        }
      },
    );
  }

  Widget listCompanyType(BuildContext context, CompanyTypeState state) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: state.companyType.length,
        itemBuilder: (context, index) {
          final element = state.companyType[index];
          return GestureDetector(
            onTap: () => context
                .read<CompanyTypeBloc>()
                .add(ConnectUserWithCompanyEvent(compRef: element.compId)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  element.uIdRef,
                  width: 10.w,
                  height: 10.h,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      IconsAssets.userIcon,
                      width: 10.w,
                      height: 10.h,
                    );
                  },
                ),
                Text(
                  element.name,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w100,
                    shadows: const [
                      Shadow(
                          color: ColorManager.black,
                          blurRadius: 1,
                          offset: Offset(1, 1))
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
