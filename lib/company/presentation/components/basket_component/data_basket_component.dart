import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/presentation/components/basket_component/update_basket_component.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_basket/basket_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/widget/show_error_widget.dart';
import 'package:tadwer_app/core/global/widget/show_loading_widget.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class DataBasketComponent extends StatelessWidget {
  const DataBasketComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) =>
          previous.dataBasketState != current.dataBasketState,
      builder: (context, state) {
        switch (state.dataBasketState) {
          case RequestState.loading:
            return const ShowLoadingWidget();
          case RequestState.error:
            return const ShowErrorWidget(
                errorText:
                    "حدث خطأ أثناء أحضار البيانات الرجاء أعادة المحاولة لاحقا");
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
      builder: (context, state) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.dataBasket.length,
            itemBuilder: (context, index) {
              final element = state.dataBasket[index];
              return Dismissible(
                key: UniqueKey(),
                confirmDismiss: (direction) {
                  return showCustomDeleteDialog(context);
                },
                onDismissed: (direction) {
                  AppConstanse.messageWarning(
                      "تم حذف ${element.wasteName} من السلة", context);
                  context.read<BasketBloc>().add(
                        DeleteBasketByWestEvent(element.wastId),
                      );
                },
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<BasketBloc>()
                        .add(ShowWasteDetEvent(element.wastId));
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
                          vertical: AppPadding.p8, horizontal: AppPadding.p8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                element.count.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                element.wasteName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox.shrink(),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          _listDet(element),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      },
    );
  }

  Widget _listDet(DataBasket element) {
    return BlocBuilder<BasketBloc, BasketState>(
      buildWhen: (previous, current) =>
          previous.changeWasteState != current.changeWasteState,
      builder: (context, state) {
        return element.showEdite
            ? UpdateBasketComponent(dataBasket: element)
            : const SizedBox.shrink();
      },
    );
  }
}

Future<bool> showCustomDeleteDialog(BuildContext context) {
  bool delete = false;
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog.adaptive(
      backgroundColor: ColorManager.white,
      content: Text(
        "هل أنت متأكد من الحذف",
        textAlign: TextAlign.right,
        style: TextStyle(
          color: ColorManager.darkBink,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        GestureDetector(
          onTap: () {
            delete = false;
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
              child: Text(
                'لا',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            delete = true;
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
              child: Text(
                'نعم',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        )
      ],
    ),
  ).then((value) => delete);
}
