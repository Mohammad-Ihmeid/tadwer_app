import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/add_basket.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/domain/usecases/add_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'waste_event.dart';
part 'waste_state.dart';

class WasteBloc extends Bloc<WasteEvent, WasteState> {
  GetWasteByCategoryUseCase getWasteByCategoryUseCase;
  AddBasketUseCase addBasketUseCase;
  WasteBloc(this.getWasteByCategoryUseCase, this.addBasketUseCase)
      : super(const WasteState()) {
    on<GetWasteByCategoryEvent>(_getWasteByCategoryEvent);

    on<AddWasteToBasketEvent>(_addWasteToBasketEvent);

    on<ShowWasteDetEvent>((event, emit) {
      emit(state.copyWith(
        wasteID: event.wasteID,
        showWasteDet: event.showWasteDet,
      ));
    });
  }

  FutureOr<void> _addWasteToBasketEvent(
      AddWasteToBasketEvent event, emit) async {
    emit(state.copyWith(addBasketState: BottomState.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int uId = prefs.getInt("Uid") ?? 0;

    final result = await addBasketUseCase(
      AddBasketParameters(
        addBasket: AddBasket(
          basId: 1,
          userRef: uId,
          wastRef: event.wasteID,
        ),
      ),
    );

    result.fold((l) {
      emit(state.copyWith(
        addBasketState: BottomState.error,
        errorAddBasket: l.message,
      ));
    }, (r) {
      emit(state.copyWith(addBasketState: BottomState.success));
    });
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
