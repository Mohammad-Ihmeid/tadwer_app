part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final List<DataBasket> dataBasket;
  final RequestState dataBasketState;
  final String dataBasketError;
  ////////////////////////////////
  final SaveState deleteWasteState;
  final String deleteWasteError;
  ////////////////////////////////
  final ChangeListState changeWasteState;
  final BottomState updateWasteState;
  final String updateWasteError;

  const BasketState({
    this.dataBasket = const [],
    this.dataBasketState = RequestState.loading,
    this.dataBasketError = '',
    ////////////////////////////////
    this.deleteWasteState = SaveState.normal,
    this.deleteWasteError = '',
    ////////////////////////////////
    this.changeWasteState = ChangeListState.status1,
    this.updateWasteState = BottomState.prePress,
    this.updateWasteError = '',
  });

  BasketState copyWith({
    List<DataBasket>? dataBasket,
    RequestState? dataBasketState,
    String? dataBasketError,
    ////////////////////////////////
    SaveState? deleteWasteState,
    String? deleteWasteError,
    ////////////////////////////////
    ChangeListState? changeWasteState,
    BottomState? updateWasteState,
    String? updateWasteError,
  }) {
    return BasketState(
      dataBasket: dataBasket ?? this.dataBasket,
      dataBasketState: dataBasketState ?? this.dataBasketState,
      dataBasketError: dataBasketError ?? this.dataBasketError,
      ////////////////////////////////
      deleteWasteState: deleteWasteState ?? this.deleteWasteState,
      deleteWasteError: deleteWasteError ?? this.deleteWasteError,
      ////////////////////////////////
      changeWasteState: changeWasteState ?? this.changeWasteState,
      updateWasteState: updateWasteState ?? this.updateWasteState,
      updateWasteError: updateWasteError ?? this.updateWasteError,
    );
  }

  @override
  List<Object> get props => [
        dataBasket,
        dataBasketState,
        dataBasketError,
        ////////////////////////////////
        deleteWasteState,
        deleteWasteError,
        ////////////////////////////////
        changeWasteState,
        updateWasteState,
        updateWasteError,
      ];
}
