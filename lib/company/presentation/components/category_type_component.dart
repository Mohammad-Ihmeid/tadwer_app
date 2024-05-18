import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/controller/company_type_bloc/company_type_bloc.dart';
import 'package:tadwer_app/company/presentation/screens/waste_screen.dart';
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
              return Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p30),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.categoryType.length,
                    itemBuilder: (context, index) {
                      final element = state.categoryType[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WasteScreen(
                                  categoryName: element.name,
                                  catId: element.catId,
                                ),
                              ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.s20)),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p4),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                    child: Image.network(
                                      element.catImg,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return const CircularProgressIndicator(
                                            color: ColorManager.darkBink);
                                      },
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          IconsAssets.userIcon,
                                          color: ColorManager.darkBink,
                                        );
                                      },
                                      color: ColorManager.darkBink,
                                    ),
                                  ),
                                  Text(
                                    element.name,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
