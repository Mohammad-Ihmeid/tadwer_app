part of 'address_bloc.dart';

class AddressState extends Equatable {
  final RequestState requestAddressState;
  final SaveState saveAddressState;
  final String saveAddressError;
  final bool checkAddress;
  final int addressId;
  final String city;
  final String area;
  final String street;
  final String phone;
  final String buildNum;
  final String additional;

  const AddressState({
    this.checkAddress = false,
    this.requestAddressState = RequestState.loading,
    this.saveAddressState = SaveState.normal,
    this.saveAddressError = '',
    this.addressId = 0,
    this.city = '',
    this.area = '',
    this.street = '',
    this.phone = '',
    this.buildNum = '',
    this.additional = '',
  });

  AddressState copyWith({
    bool? checkAddress,
    RequestState? requestAddressState,
    SaveState? saveAddressState,
    String? saveAddressError,
    int? addressId,
    String? city,
    String? area,
    String? street,
    String? phone,
    String? buildNum,
    String? additional,
  }) {
    return AddressState(
      checkAddress: checkAddress ?? this.checkAddress,
      requestAddressState: requestAddressState ?? this.requestAddressState,
      saveAddressState: saveAddressState ?? this.saveAddressState,
      saveAddressError: saveAddressError ?? this.saveAddressError,
      addressId: addressId ?? this.addressId,
      city: city ?? this.city,
      area: area ?? this.area,
      street: street ?? this.street,
      phone: phone ?? this.phone,
      buildNum: buildNum ?? this.buildNum,
      additional: additional ?? this.additional,
    );
  }

  @override
  List<Object> get props {
    return [
      requestAddressState,
      saveAddressState,
      saveAddressError,
      checkAddress,
      addressId,
      city,
      area,
      street,
      phone,
      buildNum,
      additional,
    ];
  }
}
