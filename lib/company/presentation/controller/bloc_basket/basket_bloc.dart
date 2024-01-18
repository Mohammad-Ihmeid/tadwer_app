import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/get_data_basket.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetDataBasketUseCase getDataBasketUseCase;
  BasketBloc(this.getDataBasketUseCase) : super(const BasketState()) {
    on<GetDataBasketEvent>((event, emit) async {
      emit(state.copyWith(dataBasketState: RequestState.loading));
      final result = await getDataBasketUseCase(const NoParameters());

      result.fold((l) {
        emit(state.copyWith(
            dataBasketState: RequestState.error, dataBasketError: l.message));
      }, (r) {
        emit(state.copyWith(
            dataBasket: r, dataBasketState: RequestState.loaded));
      });
    });
  }
}
