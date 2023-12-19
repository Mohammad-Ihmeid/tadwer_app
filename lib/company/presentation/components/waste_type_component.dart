import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/presentation/controller/waste_bloc/waste_bloc.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class WasteTypeComponent extends StatelessWidget {
  const WasteTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WasteBloc, WasteState>(
        buildWhen: (previous, current) =>
            previous.requestWasteState != current.requestWasteState,
        builder: (context, state) {
          switch (state.requestWasteState) {
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
              if (state.listWaste.isEmpty) {
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
                          "لا يوجد أنواع من هذا الصنف",
                          style: Theme.of(context).textTheme.headlineMedium,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.listWaste.length,
                    itemBuilder: (context, index) {
                      final element = state.listWaste[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<WasteBloc>().add(ShowWasteDetEvent(
                              wasteID: element.id, showWasteDet: true));
                        },
                        child: BlocBuilder<WasteBloc, WasteState>(
                          buildWhen: (previous, current) =>
                              previous.wasteID != current.wasteID,
                          builder: (context, state) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: AppMargin.m30,
                                    vertical: AppMargin.m8,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorManager.darkBink,
                                      borderRadius: BorderRadius.circular(
                                          AppBorderRadius.s15)),
                                  padding: const EdgeInsets.all(AppPadding.p8),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          element.wasteName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      wasteTypeDet(element, context, state),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    });
              }
          }
        });
  }

  Widget wasteTypeDet(Waste element, BuildContext context, WasteState state) {
    if (state.showWasteDet && (state.wasteID == element.id)) {
      return BlocBuilder<WasteBloc, WasteState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppBorderRadius.s15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "تقدير العدد",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => context
                        .read<WasteBloc>()
                        .add(AddWasteToBasketEvent(wasteID: element.id)),
                    child: Container(
                      color: Colors.transparent,
                      child: Text(
                        "أضافة",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: ColorManager.darkBink,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
    } else {
      return const SizedBox.shrink();
    }
  }
}
