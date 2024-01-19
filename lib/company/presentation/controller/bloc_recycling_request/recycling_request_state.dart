part of 'recycling_request_bloc.dart';

class RecyclingRequestState extends Equatable {
  final RequestState requestAddressState;
  final String saveAddressError;
  final bool checkAddress;
  //////////////////////////////////////
  final SaveState recyclingSaveState;
  final String recyclingError;
  //////////////////////////////////////
  final List<DataBasket> dataBasket;

  const RecyclingRequestState({
    this.checkAddress = false,
    this.requestAddressState = RequestState.loading,
    this.saveAddressError = '',
    //////////////////////////////////////
    this.recyclingSaveState = SaveState.normal,
    this.recyclingError = '',
    //////////////////////////////////////
    this.dataBasket = const [],
  });

  RecyclingRequestState copyWith({
    bool? checkAddress,
    RequestState? requestAddressState,
    String? saveAddressError,
    //////////////////////////////////////
    SaveState? recyclingSaveState,
    String? recyclingError,
    //////////////////////////////////////
    List<DataBasket>? dataBasket,
  }) {
    return RecyclingRequestState(
      checkAddress: checkAddress ?? this.checkAddress,
      requestAddressState: requestAddressState ?? this.requestAddressState,
      saveAddressError: saveAddressError ?? this.saveAddressError,
      //////////////////////////////////////
      recyclingSaveState: recyclingSaveState ?? this.recyclingSaveState,
      recyclingError: recyclingError ?? this.recyclingError,
      //////////////////////////////////////
      dataBasket: dataBasket ?? this.dataBasket,
    );
  }

  @override
  List<Object> get props {
    return [
      checkAddress,
      requestAddressState,
      saveAddressError,
      //////////////////////////////////////
      recyclingSaveState,
      recyclingError,
      //////////////////////////////////////
      dataBasket,
    ];
  }
}
