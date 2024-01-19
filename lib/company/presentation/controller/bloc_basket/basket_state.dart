part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<DataBasket> dataBasket;
  final RequestState dataBasketState;
  final String dataBasketError;
  ////////////////////////////////
  final SaveState deleteWasteState;
  final String deleteWasteError;

  const BasketState({
    this.dataBasket = const [],
    this.dataBasketState = RequestState.loading,
    this.dataBasketError = '',
    this.deleteWasteState = SaveState.normal,
    this.deleteWasteError = '',
  });

  BasketState copyWith({
    List<DataBasket>? dataBasket,
    RequestState? dataBasketState,
    String? dataBasketError,
    SaveState? deleteWasteState,
    String? deleteWasteError,
  }) {
    return BasketState(
      dataBasket: dataBasket ?? this.dataBasket,
      dataBasketState: dataBasketState ?? this.dataBasketState,
      dataBasketError: dataBasketError ?? this.dataBasketError,
      deleteWasteState: deleteWasteState ?? this.deleteWasteState,
      deleteWasteError: deleteWasteError ?? this.deleteWasteError,
    );
  }

  @override
  List<Object> get props => [
        dataBasket,
        dataBasketState,
        dataBasketError,
        deleteWasteState,
        deleteWasteError,
      ];
}
