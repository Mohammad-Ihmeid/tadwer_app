import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_address_text_field.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_address/address_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

Future<dynamic> showAddressDialog(BuildContext context) {
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController buildNum = TextEditingController();
  TextEditingController additional = TextEditingController();
  const riKey1 = Key('__RIKEY1__');
  return showAdaptiveDialog(
    context: context,
    builder: (ctx) => BlocProvider(
      create: (context) => getIt<AddressBloc>()..add(CheckAddressEvent()),
      child: BlocConsumer<AddressBloc, AddressState>(
        listenWhen: (previous, current) =>
            previous.saveAddressState != current.saveAddressState,
        listener: (context, state) {
          if (state.saveAddressState == SaveState.loading) {
            LoadingDialog.show(context, key: riKey1);
          } else if (state.saveAddressState == SaveState.error) {
            LoadingDialog.hide(context);
            AppConstanse.messageWarning(state.saveAddressError, context);
          } else if (state.saveAddressState == SaveState.success) {
            LoadingDialog.hide(context);
            showCustomSaveDialog(context, "تم الحفظ بنجاح").then((value) {
              Navigator.pop(context);
            });
          }
        },
        buildWhen: (previous, current) =>
            previous.requestAddressState != current.requestAddressState,
        builder: (context, state) {
          city.text = state.city;
          area.text = state.area;
          street.text = state.street;
          buildNum.text = state.buildNum;
          additional.text = state.additional;
          phone.text = state.phone;
          switch (state.requestAddressState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 170.0,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.white,
                  )));
            case RequestState.error:
            case RequestState.loaded:
              return Material(
                color: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: AppPadding.p50,
                    horizontal: AppPadding.p16,
                  ),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    color: ColorManager.gray,
                    borderRadius: BorderRadius.circular(AppBorderRadius.s15),
                  ),
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.close,
                                    color: ColorManager.error,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: city,
                              hintText: "المحافظة",
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: area,
                              hintText: "المنطقة",
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: street,
                              hintText: "الشارع",
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: phone,
                              hintText: "رقم الهاتف",
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: buildNum,
                              hintText: "رقم البناية",
                            ),
                            SizedBox(height: 1.h),
                            CustomAddressTextField(
                              controller: additional,
                              hintText: "معلومات أضافية",
                            ),
                            SizedBox(height: 1.h),
                            BlocBuilder<AddressBloc, AddressState>(
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: () {
                                    context.read<AddressBloc>().add(
                                          UpdateAddressEvent(
                                            city: city.text,
                                            area: area.text,
                                            street: street.text,
                                            phone: phone.text,
                                            buildNum: buildNum.text,
                                            additional: additional.text,
                                          ),
                                        );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        ColorManager.darkBink),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(double.infinity, 10)),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(AppPadding.p8)),
                                  ),
                                  child: Text(
                                    "حفظ",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
          }
        },
      ),
    ),
  );
}
