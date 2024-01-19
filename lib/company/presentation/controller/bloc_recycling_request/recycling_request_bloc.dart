import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/check_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'recycling_request_event.dart';
part 'recycling_request_state.dart';

class RecyclingRequestBloc
    extends Bloc<RecyclingRequestEvent, RecyclingRequestState> {
  final CheckUserAddressUseCase checkAddressUseCase;
  final GetDataBasketUseCase getDataBasketUseCase;
  RecyclingRequestBloc(
    this.checkAddressUseCase,
    this.getDataBasketUseCase,
  ) : super(const RecyclingRequestState()) {
    on<CheckAddressEvent>(_checkAddressEvent);
    on<GetDataBasketEvent>((event, emit) async {
      final result = await getDataBasketUseCase(const NoParameters());

      result.fold((l) {}, (r) {
        emit(state.copyWith(dataBasket: r));
      });
    });
    on<RecyclingSaveEvent>((event, emit) async {
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
      } else {
        emit(
          state.copyWith(recyclingSaveState: SaveState.success),
        );
      }
    });
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
