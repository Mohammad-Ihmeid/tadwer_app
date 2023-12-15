import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'waste_event.dart';
part 'waste_state.dart';

class WasteBloc extends Bloc<WasteEvent, WasteState> {
  GetWasteByCategoryUseCase getWasteByCategoryUseCase;
  WasteBloc(this.getWasteByCategoryUseCase) : super(const WasteState()) {
    on<GetWasteByCategoryEvent>(_getWasteByCategoryEvent);
  }

  FutureOr<void> _getWasteByCategoryEvent(event, emit) async {
    final result = await getWasteByCategoryUseCase(
      GetWasteByCategoryParameters(catId: event.catId),
    );
    result.fold((l) {
      emit(state.copyWith(
        requestWasteState: RequestState.error,
        errorWasteMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestWasteState: RequestState.loaded,
          listWaste: r,
        ),
      );
    });
  }
}
