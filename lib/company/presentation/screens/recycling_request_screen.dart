import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/presentation/components/address_component/add_address_component.dart';
import 'package:tadwer_app/company/presentation/components/widget/custom_app_bar.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_recycling_request/recycling_request_bloc.dart';
import 'package:tadwer_app/core/services/services_locator.dart';
import 'package:tadwer_app/core/utils/assets_manager.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class RecyclingRequestScreen extends StatelessWidget {
  final TextEditingController city = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController buildNum = TextEditingController();
  final TextEditingController additional = TextEditingController();
  RecyclingRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<RecyclingRequestBloc>()..add(GetDataBasketEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Image.asset(
                  ImagesAssets.backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAppBar.appBar(context),
                  listDataBasket(),
                  BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          showAddAddressDialog(context);
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(AppPadding.p16),
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p16),
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
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(AppPadding.p16),
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p16),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.s15),
                      ),
                      child: Text(
                        "طلب تدوير",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
