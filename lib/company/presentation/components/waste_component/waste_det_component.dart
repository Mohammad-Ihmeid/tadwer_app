import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';
import 'package:tadwer_app/company/presentation/controller/waste_bloc/waste_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/unique_key.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class WasteDetComponent extends StatelessWidget {
  final Waste item;
  final TextEditingController count = TextEditingController();
  WasteDetComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WasteBloc, WasteState>(
        listenWhen: (previous, current) =>
            previous.addBasketState != current.addBasketState,
        listener: (context, state) {
          if (state.addBasketState == BottomState.loading) {
            LoadingDialog.show(context, key: UnKey.unKey2);
          } else if (state.addBasketState == BottomState.error) {
            LoadingDialog.hide(context);
            AppConstanse.messageWarning(state.errorAddBasket, context);
          } else if (state.addBasketState == BottomState.success) {
            LoadingDialog.hide(context);
            showCustomSaveDialog(context, "تم الاضافة بنجاح");
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            margin: const EdgeInsets.only(top: AppMargin.m8),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppBorderRadius.s15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: 5,
                  color: ColorManager.darkBink,
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => context.read<WasteBloc>().add(
                            AddWasteToBasketEvent(
                              wasteID: item.westRef,
                              count: count.text,
                            ),
                          ),
                      child: Container(
                        color: Colors.transparent,
                        child: Text(
                          "اضافة كمية تقديرية",
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
                          contentPadding: const EdgeInsets.only(left: 6),
                          suffixText: "عدد",
                          suffixStyle: TextStyle(
                            color: ColorManager.darkBink,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15),
                            borderSide: const BorderSide(
                                color: ColorManager.darkBink, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15),
                            borderSide: const BorderSide(
                                color: ColorManager.darkBink, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15),
                            borderSide: const BorderSide(
                                color: ColorManager.darkBink, width: 2),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: () => context.read<WasteBloc>().add(
                            AddWasteToBasketEvent(
                              wasteID: item.westRef,
                              count: count.text,
                            ),
                          ),
                      child: Container(
                        color: Colors.transparent,
                        child: Icon(
                          Icons.done,
                          color: ColorManager.darkBink,
                          size: 25.sp,
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
