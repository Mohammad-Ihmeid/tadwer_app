part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<DataBasket> dataBasket;
  final RequestState dataBasketState;
  final String dataBasketError;

  const BasketState({
    this.dataBasket = const [],
    this.dataBasketState = RequestState.loading,
    this.dataBasketError = '',
  });

  BasketState copyWith({
    List<DataBasket>? dataBasket,
    RequestState? dataBasketState,
    String? dataBasketError,
  }) {
    return BasketState(
      dataBasket: dataBasket ?? this.dataBasket,
      dataBasketState: dataBasketState ?? this.dataBasketState,
      dataBasketError: dataBasketError ?? this.dataBasketError,
    );
  }

  @override
  List<Object> get props => [dataBasket, dataBasketState, dataBasketError];
}
