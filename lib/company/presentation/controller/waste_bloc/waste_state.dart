part of 'waste_bloc.dart';

class WasteState extends Equatable {
  final List<Waste> listWaste;
  final RequestState requestWasteState;
  final String errorWasteMessage;

  const WasteState({
    this.listWaste = const [],
    this.requestWasteState = RequestState.loading,
    this.errorWasteMessage = '',
  });

  WasteState copyWith({
    List<Waste>? listWaste,
    RequestState? requestWasteState,
    String? errorWasteMessage,
  }) {
    return WasteState(
      listWaste: listWaste ?? this.listWaste,
      requestWasteState: requestWasteState ?? this.requestWasteState,
      errorWasteMessage: errorWasteMessage ?? this.errorWasteMessage,
    );
  }

  @override
  List<Object> get props => [listWaste, requestWasteState, errorWasteMessage];
}
