// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/update_address_model.dart';

class UpdateAddress extends Equatable {
  final int addressId;
  final int userRef;
  final String city;
  final String area;
  final String street;
  final String phone;
  final String buildNum;
  final String additional;

  const UpdateAddress({
    required this.addressId,
    required this.userRef,
    required this.city,
    required this.area,
    required this.street,
    required this.phone,
    required this.buildNum,
    required this.additional,
  });

  UpdateAddressModel toModel() {
    return UpdateAddressModel(
      addressId: addressId,
      userRef: userRef,
      city: city,
      area: area,
      street: street,
      phone: phone,
      buildNum: buildNum,
      additional: additional,
    );
  }

  @override
  List<Object> get props {
    return [
      addressId,
      userRef,
      city,
      area,
      street,
      phone,
      buildNum,
      additional,
    ];
  }
}
