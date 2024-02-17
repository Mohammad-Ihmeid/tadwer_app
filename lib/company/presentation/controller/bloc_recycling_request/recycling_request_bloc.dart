import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/check_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/order_usecase/add_order_usecase.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'recycling_request_event.dart';
part 'recycling_request_state.dart';

class RecyclingRequestBloc
    extends Bloc<RecyclingRequestEvent, RecyclingRequestState> {
  final CheckUserAddressUseCase checkAddressUseCase;
  final GetDataBasketUseCase getDataBasketUseCase;
  final AddOrderUseCase addOrderUseCase;
  RecyclingRequestBloc(
    this.checkAddressUseCase,
    this.getDataBasketUseCase,
    this.addOrderUseCase,
  ) : super(const RecyclingRequestState()) {
    on<CheckAddressEvent>(_checkAddressEvent);

    on<ChoosingDaysEvent>(_choosingDaysEvent);

    on<GetDataBasketEvent>(_getDataBasketEvent);

    on<RecyclingSaveEvent>(_recyclingSaveEvent);
  }

  FutureOr<void> _recyclingSaveEvent(event, emit) async {
    emit(state.copyWith(recyclingSaveState: SaveState.loading));
    if (state.dataBasket.isEmpty) {
      emit(
        state.copyWith(
            recyclingSaveState: SaveState.error,
            recyclingError: "الرجاء وضع مواد داخل السلة"),
      );
    } else if (!state.checkAddress) {
      emit(
        state.copyWith(
            recyclingSaveState: SaveState.error,
            recyclingError: "الرجاء أضافة الموقع"),
      );
    } else if (state.daysList.isEmpty) {
      emit(
        state.copyWith(
            recyclingSaveState: SaveState.error,
            recyclingError: "الرجاء تحديد يوم واحد على الاقل"),
      );
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final int uid = prefs.getInt("Uid") ?? 0;

      final result = await addOrderUseCase(AddOrderParameters(
        OrderRequest(
          basketId: state.dataBasket[0].basId,
          daysNum: state.daysList,
          userId: uid,
        ),
      ));

      result.fold((l) {
        emit(
          state.copyWith(
            recyclingSaveState: SaveState.error,
            recyclingError: l.message,
          ),
        );
      }, (r) {
        emit(state.copyWith(recyclingSaveState: SaveState.success));
      });
    }
  }

  FutureOr<void> _getDataBasketEvent(event, emit) async {
    final result = await getDataBasketUseCase(const NoParameters());

    result.fold((l) {}, (r) {
      emit(state.copyWith(dataBasket: r));
    });
  }

  FutureOr<void> _choosingDaysEvent(event, emit) {
    List<int> daysNum = [];
    if (state.daysList.isNotEmpty) {
      state.daysList.map((e) {
        daysNum.add(e);
      });
    }
    if (event.indexDay == 1) {
      emit(state.copyWith(datsNum1: {"ID": 1, "Value": event.dayValue}));
    } else if (event.indexDay == 2) {
      emit(state.copyWith(datsNum2: {"ID": 2, "Value": event.dayValue}));
    } else if (event.indexDay == 3) {
      emit(state.copyWith(datsNum3: {"ID": 3, "Value": event.dayValue}));
    } else if (event.indexDay == 4) {
      emit(state.copyWith(datsNum4: {"ID": 4, "Value": event.dayValue}));
    } else if (event.indexDay == 5) {
      emit(state.copyWith(datsNum5: {"ID": 5, "Value": event.dayValue}));
    } else if (event.indexDay == 6) {
      emit(state.copyWith(datsNum6: {"ID": 6, "Value": event.dayValue}));
    } else if (event.indexDay == 7) {
      emit(state.copyWith(datsNum7: {"ID": 7, "Value": event.dayValue}));
    }
    daysNum.add(event.indexDay);
    emit(state.copyWith(daysList: daysNum));
  }

  FutureOr<void> _checkAddressEvent(event, emit) async {
    emit(state.copyWith(requestAddressState: RequestState.loading));
    final result = await checkAddressUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(requestAddressState: RequestState.error));
    }, (r) {
      emit(
        state.copyWith(
          checkAddress: r.success,
          requestAddressState: RequestState.loaded,
        ),
      );
    });
  }
}
