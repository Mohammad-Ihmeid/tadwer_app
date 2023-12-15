import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
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
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: AppMargin.m30,
                            vertical: AppMargin.m8,
                          ),
                          decoration: BoxDecoration(
                              color: ColorManager.darkBink,
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.s15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p4),
                            child: Center(
                              child: Text(
                                element.wasteName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
          }
        });
  }
}
