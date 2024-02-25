import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/update_basket.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/delete_basket_by_west_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/update_basket_usecase.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetDataBasketUseCase getDataBasketUseCase;
  final DeleteBasketByWestUseCase deleteBasketByWestUseCase;
  final UpdateBasketUseCase updateBasketUseCase;
  BasketBloc(
    this.getDataBasketUseCase,
    this.deleteBasketByWestUseCase,
    this.updateBasketUseCase,
  ) : super(const BasketState()) {
    on<GetDataBasketEvent>(_getDataBasketEvent);

    on<DeleteBasketByWestEvent>((event, emit) async {
      await deleteBasketByWestUseCase(
          DeleteBasketByWestParameters(event.wastRef));
    });

    on<ShowWasteDetEvent>(_showWasteDetEvent);

    on<UpdateBasketEvent>((event, emit) async {
      emit(state.copyWith(updateWasteState: BottomState.loading));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      int uId = prefs.getInt("Uid") ?? 0;

      double? count = double.tryParse(event.count);

      if (count != null) {
        final result = await updateBasketUseCase(
          UpdateBasketParameters(UpdateBasket(
              userRef: uId,
              wastRef: event.wastRef,
              basId: event.basId,
              count: count)),
        );

        result.fold((l) {
          emit(state.copyWith(
            updateWasteState: BottomState.error,
            updateWasteError: l.message,
          ));
        }, (r) {
          emit(state.copyWith(updateWasteState: BottomState.success));
        });
      } else {
        emit(state.copyWith(
          updateWasteState: BottomState.error,
          updateWasteError: "الرجاء أدخال الكمية بشكل صحيح",
        ));
      }
    });
  }

  FutureOr<void> _showWasteDetEvent(event, emit) {
    List<DataBasket> list = state.dataBasket.map((e) {
      if (e.wastId == event.westRef) {
        e.showEdite = !e.showEdite;
      } else {
        e.showEdite = false;
      }
      return e;
    }).toList();
    ChangeListState change = state.changeWasteState;
    if (change == ChangeListState.status1) {
      change = ChangeListState.status2;
    } else {
      change = ChangeListState.status1;
    }
    emit(state.copyWith(
      updateWasteState: BottomState.prePress,
      dataBasket: list,
      changeWasteState: change,
    ));
  }

  FutureOr<void> _getDataBasketEvent(event, emit) async {
    emit(state.copyWith(dataBasketState: RequestState.loading));
    final result = await getDataBasketUseCase(const NoParameters());

    result.fold((l) {
      emit(state.copyWith(
          dataBasketState: RequestState.error, dataBasketError: l.message));
    }, (r) {
      emit(state.copyWith(dataBasket: r, dataBasketState: RequestState.loaded));
    });
  }
}
