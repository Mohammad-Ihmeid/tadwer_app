part of 'waste_bloc.dart';

class WasteState extends Equatable {
  final List<Waste> listWaste;
  final RequestState requestWasteState;
  final String errorWasteMessage;
  final int wasteID;
  final bool showWasteDet;

  const WasteState({
    this.listWaste = const [],
    this.requestWasteState = RequestState.loading,
    this.errorWasteMessage = '',
    this.wasteID = 0,
    this.showWasteDet = false,
  });

  WasteState copyWith({
    List<Waste>? listWaste,
    RequestState? requestWasteState,
    String? errorWasteMessage,
    int? wasteID,
    bool? showWasteDet,
  }) {
    return WasteState(
      listWaste: listWaste ?? this.listWaste,
      requestWasteState: requestWasteState ?? this.requestWasteState,
      errorWasteMessage: errorWasteMessage ?? this.errorWasteMessage,
      wasteID: wasteID ?? this.wasteID,
      showWasteDet: showWasteDet ?? this.showWasteDet,
    );
  }

  @override
  List<Object> get props => [
        listWaste,
        requestWasteState,
        errorWasteMessage,
        wasteID,
        showWasteDet,
      ];
}
