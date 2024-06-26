import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/recycling_component/address_component.dart';
import 'package:tadwer_app/company/presentation/components/recycling_component/days_num_component.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_recycling_request/recycling_request_bloc.dart';
import 'package:tadwer_app/core/constanses.dart';
import 'package:tadwer_app/core/global/routes/app_routes.dart';
import 'package:tadwer_app/core/global/unique_key.dart';
import 'package:tadwer_app/core/global/widget/custom_save_dialog.dart';
import 'package:tadwer_app/core/global/widget/show_loading_dialog.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class RecyclingRequestScreen extends StatelessWidget {
  const RecyclingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecyclingRequestBloc>()
        ..add(GetDataBasketEvent())
        ..add(CheckAddressEvent()),
      child: BlocListener<RecyclingRequestBloc, RecyclingRequestState>(
        listenWhen: (previous, current) =>
            previous.recyclingSaveState != current.recyclingSaveState,
        listener: (context, state) {
          if (state.recyclingSaveState == SaveState.loading) {
            LoadingDialog.show(context, key: UnKey.unKey3);
          } else if (state.recyclingSaveState == SaveState.error) {
            LoadingDialog.hide(context);
            AppConstanse.messageWarning(state.recyclingError, context);
          } else if (state.recyclingSaveState == SaveState.success) {
            LoadingDialog.hide(context);
            context.read<RecyclingRequestBloc>().add(GetDataBasketEvent());
            showCustomSaveDialog(context, "تم طلب التدوير بنجاح");
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Image.asset(
                  ImagesAssets.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p16,
                          vertical: AppPadding.p30,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, Routes.userInfo),
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: ColorManager.white),
                                  color: Colors.transparent,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person_outline_rounded,
                                    color: ColorManager.white,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              ImagesAssets.logoNameApp,
                              color: ColorManager.white,
                              width: 50.w,
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: ColorManager.white,
                                size: 30.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // CustomAppBar.appBar(context: context),
                      listDataBasket(),
                      const Divider(color: ColorManager.white),
                      const DaysNumComponent(),
                      GestureDetector(
                        onTap: () {
                          ShowAddressDialog.show(context, key: UniqueKey())
                              .then((value) {
                            context
                                .read<RecyclingRequestBloc>()
                                .add(RecyclingSaveEvent());
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(AppPadding.p8),
                          padding: const EdgeInsets.all(AppPadding.p8),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.s15),
                          ),
                          child: Text(
                            "أضافة الموقع",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(AppPadding.p8),
                        padding: const EdgeInsets.all(AppPadding.p8),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius:
                              BorderRadius.circular(AppBorderRadius.s15),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "أضافة ملاحظة",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            SizedBox(width: 3.w),
                            Expanded(child: noteWidget(context))
                          ],
                        ),
                      ),
                      _recyclingSaveButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget noteWidget(BuildContext context) {
    return BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
      builder: (context, state) {
        return TextField(
          controller: context.read<RecyclingRequestBloc>().noteController,
        );
      },
    );
  }

  Widget _recyclingSaveButton(BuildContext context) {
    return BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () =>
              context.read<RecyclingRequestBloc>().add(RecyclingSaveEvent()),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(AppPadding.p8),
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppBorderRadius.s15),
            ),
            child: Text(
              "طلب تدوير",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
      },
    );
  }

  Widget listDataBasket() {
    return BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
      buildWhen: (previous, current) =>
          previous.dataBasket.length != current.dataBasket.length,
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.dataBasket.length,
          itemBuilder: (context, index) {
            final element = state.dataBasket[index];
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p16, vertical: 2),
                child: Row(
                  children: [
                    Text(
                      element.wasteName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      element.count.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
