import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';
import 'package:tadwer_app/company/presentation/components/waste_component/waste_det_component.dart';
import 'package:tadwer_app/company/presentation/controller/waste_bloc/waste_bloc.dart';
import 'package:tadwer_app/core/global/widget/show_error_widget.dart';
import 'package:tadwer_app/core/global/widget/show_loading_widget.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:tadwer_app/core/utils/values_manager.dart';

class WasteTypeComponent extends StatelessWidget {
  final TextEditingController count = TextEditingController();
  WasteTypeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WasteBloc, WasteState>(
        buildWhen: (previous, current) =>
            previous.requestWasteState != current.requestWasteState,
        builder: (context, state) {
          switch (state.requestWasteState) {
            case RequestState.loading:
              return const ShowLoadingWidget();
            case RequestState.error:
              return ShowErrorWidget(errorText: state.errorWasteMessage);
            case RequestState.loaded:
              if (state.listWaste.isEmpty) {
                return const ShowErrorWidget(
                    errorText: "لا يوجد أنواع من هذا الصنف");
              } else {
                return _listWaste(context, state);
              }
          }
        });
  }

  Widget _listWaste(BuildContext context, WasteState state) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: state.listWaste.map((element) {
        return GestureDetector(
          onTap: () {
            context.read<WasteBloc>().add(ShowWasteDetEvent(element.westRef));
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m30,
                  vertical: AppMargin.m8,
                ),
                decoration: BoxDecoration(
                    color: ColorManager.darkBink,
                    borderRadius: BorderRadius.circular(AppBorderRadius.s15)),
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        element.wasteName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    _listDet(element),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _listDet(Waste element) {
    return BlocBuilder<WasteBloc, WasteState>(
      buildWhen: (previous, current) =>
          previous.changeListWaste != current.changeListWaste,
      builder: (context, state) {
        return element.showWest
            ? WasteDetComponent(item: element)
            : const SizedBox.shrink();
      },
    );
  }
}
