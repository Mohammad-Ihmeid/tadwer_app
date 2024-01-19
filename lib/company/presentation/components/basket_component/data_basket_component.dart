import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_basket/basket_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class DataBasketComponent extends StatelessWidget {
  final riKey3 = const Key('__RIKEY3__');
  final riKey4 = UniqueKey();
  DataBasketComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) =>
          previous.dataBasketState != current.dataBasketState,
      builder: (context, state) {
        switch (state.dataBasketState) {
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
            if (state.dataBasket.isEmpty) {
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
                        "لا يوجد مواد داخل السلة",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return _listWaste();
            }
        }
      },
    );
  }

  Widget _listWaste() {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) =>
          previous.deleteWasteState != current.deleteWasteState,
      builder: (context, state) {
        switch (state.deleteWasteState) {
          case SaveState.loading:
            return const SizedBox(
                height: 170.0,
                child: Center(
                    child: CircularProgressIndicator(
                  color: ColorManager.white,
                )));
          case SaveState.error:
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
          case SaveState.normal:
          case SaveState.success:
            if (state.dataBasket.isEmpty) {
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
                        "لا يوجد مواد داخل السلة",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.dataBasket.length,
                  itemBuilder: (context, index) {
                    final element = state.dataBasket[index];
                    return Dismissible(
                      key: Key(element.wastId.toString()),
                      onDismissed: (direction) {
                        context.read<BasketBloc>().add(
                              DeleteBasketByWestEvent(element.wastId),
                            );
                      },
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => WasteScreen(
                          //         categoryName: element.name,
                          //         catId: element.catId,
                          //       ),
                          //     ));
                        },
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
                      ),
                    );
                  });
            }
        }
      },
    );
  }
}
