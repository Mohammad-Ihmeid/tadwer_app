part of 'address_bloc.dart';

sealed class AddressEvent extends Equatable {}

class CheckAddressEvent extends AddressEvent {
  @override
  List<Object> get props => [];
}

class UpdateAddressEvent extends AddressEvent {
  final String city;
  final String area;
  final String street;
  final String phone;
  final String buildNum;
  final String additional;

  UpdateAddressEvent({
    required this.city,
    required this.area,
    required this.street,
    required this.phone,
    required this.buildNum,
    required this.additional,
  });

  @override
  List<Object> get props => [
        city,
        area,
        street,
        phone,
        buildNum,
        additional,
      ];
}
