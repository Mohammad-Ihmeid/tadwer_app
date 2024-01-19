part of 'waste_bloc.dart';

class WasteState extends Equatable {
  final List<Waste> listWaste;
  final RequestState requestWasteState;
  final ChangeListState changeListWaste;
  final String errorWasteMessage;
  /* ------------------------------------- */
  final BottomState addBasketState;
  final String errorAddBasket;

  const WasteState({
    this.listWaste = const [],
    this.requestWasteState = RequestState.loading,
    this.changeListWaste = ChangeListState.status1,
    this.errorWasteMessage = '',
    this.addBasketState = BottomState.prePress,
    this.errorAddBasket = '',
  });

  WasteState copyWith({
    List<Waste>? listWaste,
    RequestState? requestWasteState,
    ChangeListState? changeListWaste,
    String? errorWasteMessage,
    BottomState? addBasketState,
    String? errorAddBasket,
  }) {
    return WasteState(
      listWaste: listWaste ?? this.listWaste,
      requestWasteState: requestWasteState ?? this.requestWasteState,
      changeListWaste: changeListWaste ?? this.changeListWaste,
      errorWasteMessage: errorWasteMessage ?? this.errorWasteMessage,
      addBasketState: addBasketState ?? this.addBasketState,
      errorAddBasket: errorAddBasket ?? this.errorAddBasket,
    );
  }

  @override
  List<Object> get props => [
        listWaste,
        requestWasteState,
        changeListWaste,
        errorWasteMessage,
        addBasketState,
        errorAddBasket,
      ];
}
