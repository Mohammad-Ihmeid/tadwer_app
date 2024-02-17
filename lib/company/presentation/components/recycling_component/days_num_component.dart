import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadwer_app/company/presentation/controller/bloc_recycling_request/recycling_request_bloc.dart';
import 'package:tadwer_app/core/utils/color_manger.dart';

class DaysNumComponent extends StatelessWidget {
  const DaysNumComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum1["Value"] != current.datsNum1["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(1, !state.datsNum1["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum1["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(1, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الاحد",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum2["Value"] != current.datsNum2["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(2, !state.datsNum2["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum2["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(2, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الاثنين",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum3["Value"] != current.datsNum3["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(3, !state.datsNum3["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum3["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(3, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الثلاثاء",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum4["Value"] != current.datsNum4["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(4, !state.datsNum4["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum4["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(4, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الاربعاء",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum5["Value"] != current.datsNum5["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(5, !state.datsNum5["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum5["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(5, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الخميس",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum6["Value"] != current.datsNum6["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(6, !state.datsNum6["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum6["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(6, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "الجمعة",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
        BlocBuilder<RecyclingRequestBloc, RecyclingRequestState>(
          buildWhen: (previous, current) =>
              previous.datsNum7["Value"] != current.datsNum7["Value"],
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<RecyclingRequestBloc>()
                  .add(ChoosingDaysEvent(7, !state.datsNum7["Value"])),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: state.datsNum7["Value"],
                    onChanged: (value) => context
                        .read<RecyclingRequestBloc>()
                        .add(ChoosingDaysEvent(7, value!)),
                    side: const BorderSide(color: ColorManager.white),
                  ),
                  Text(
                    "السبت",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
