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
  //////////////////////////////////////
  final List<int> daysList;
  //////////////////////////////////////
  final Map<String, dynamic> datsNum1;
  final Map<String, dynamic> datsNum2;
  final Map<String, dynamic> datsNum3;
  final Map<String, dynamic> datsNum4;
  final Map<String, dynamic> datsNum5;
  final Map<String, dynamic> datsNum6;
  final Map<String, dynamic> datsNum7;

  const RecyclingRequestState({
    this.checkAddress = false,
    this.requestAddressState = RequestState.loading,
    this.saveAddressError = '',
    //////////////////////////////////////
    this.recyclingSaveState = SaveState.normal,
    this.recyclingError = '',
    //////////////////////////////////////
    this.dataBasket = const [],
    //////////////////////////////////////
    this.daysList = const [],
    //////////////////////////////////////
    this.datsNum1 = const {"ID": 1, "Value": false},
    this.datsNum2 = const {"ID": 2, "Value": false},
    this.datsNum3 = const {"ID": 3, "Value": false},
    this.datsNum4 = const {"ID": 4, "Value": false},
    this.datsNum5 = const {"ID": 5, "Value": false},
    this.datsNum6 = const {"ID": 6, "Value": false},
    this.datsNum7 = const {"ID": 7, "Value": false},
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
    //////////////////////////////////////
    List<int>? daysList,
    //////////////////////////////////////
    Map<String, dynamic>? datsNum1,
    Map<String, dynamic>? datsNum2,
    Map<String, dynamic>? datsNum3,
    Map<String, dynamic>? datsNum4,
    Map<String, dynamic>? datsNum5,
    Map<String, dynamic>? datsNum6,
    Map<String, dynamic>? datsNum7,
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
      //////////////////////////////////////
      daysList: daysList ?? this.daysList,
      //////////////////////////////////////
      datsNum1: datsNum1 ?? this.datsNum1,
      datsNum2: datsNum2 ?? this.datsNum2,
      datsNum3: datsNum3 ?? this.datsNum3,
      datsNum4: datsNum4 ?? this.datsNum4,
      datsNum5: datsNum5 ?? this.datsNum5,
      datsNum6: datsNum6 ?? this.datsNum6,
      datsNum7: datsNum7 ?? this.datsNum7,
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
      //////////////////////////////////////
      daysList,
      //////////////////////////////////////
      datsNum1,
      datsNum2,
      datsNum3,
      datsNum4,
      datsNum5,
      datsNum6,
      datsNum7,
    ];
  }
}
