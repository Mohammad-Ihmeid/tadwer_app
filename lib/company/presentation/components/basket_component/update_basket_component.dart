import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_basket/basket_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/unique_key.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class UpdateBasketComponent extends StatelessWidget {
  final DataBasket dataBasket;
  final TextEditingController count = TextEditingController();
  UpdateBasketComponent({super.key, required this.dataBasket});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketBloc, BasketState>(
        listenWhen: (previous, current) =>
            previous.updateWasteState != current.updateWasteState,
        listener: (context, state) {
          if (state.updateWasteState == BottomState.loading) {
            LoadingDialog.show(context, key: UnKey.unKey5);
          } else if (state.updateWasteState == BottomState.error) {
            LoadingDialog.hide(context);
            AppConstanse.messageWarning(state.updateWasteError, context);
          } else if (state.updateWasteState == BottomState.success) {
            LoadingDialog.hide(context);
            context.read<BasketBloc>().add(GetDataBasketEvent());
            showCustomSaveDialog(context, "تم التعديل بنجاح");
          }
        },
        buildWhen: (previous, current) =>
            previous.updateWasteState != current.updateWasteState,
        builder: (context, state) {
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
                      onTap: () {
                        context.read<BasketBloc>().add(
                              UpdateBasketEvent(count.text, dataBasket.wastId,
                                  dataBasket.basId),
                            );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "تعديل",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: TextField(
                        controller: count,
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
  }
}
