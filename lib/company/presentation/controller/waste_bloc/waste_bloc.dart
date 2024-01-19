import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/add_basket.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/add_basket_usecase.dart';
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
      List<Waste> list = state.listWaste.map((e) {
        if (e.westRef == event.westRef) {
          e.showWest = !e.showWest;
        } else {
          e.showWest = false;
        }
        return e;
      }).toList();
      ChangeListState change = state.changeListWaste;
      if (change == ChangeListState.status1) {
        change = ChangeListState.status2;
      } else {
        change = ChangeListState.status1;
      }
      emit(state.copyWith(
        addBasketState: BottomState.prePress,
        listWaste: list,
        changeListWaste: change,
      ));
    });
  }

  FutureOr<void> _addWasteToBasketEvent(
      AddWasteToBasketEvent event, emit) async {
    emit(state.copyWith(addBasketState: BottomState.loading));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int uId = prefs.getInt("Uid") ?? 0;

    int? count = int.tryParse(event.count);

    if (count != null) {
      final result = await addBasketUseCase(
        AddBasketParameters(
          addBasket:
              AddBasket(userRef: uId, wastRef: event.wasteID, count: count),
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
    } else {
      emit(state.copyWith(
        addBasketState: BottomState.error,
        errorAddBasket: "الرجاء أدخال الكمية بشكل صحيح",
      ));
    }
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
