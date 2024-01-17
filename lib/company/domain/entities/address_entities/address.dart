// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final bool success;
  final int addressId;
  final String city;
  final String area;
  final String street;
  final String phone;
  final String buildNum;
  final String additional;

  const Address({
    required this.success,
    required this.addressId,
    required this.city,
    required this.area,
    required this.street,
    required this.phone,
    required this.buildNum,
    required this.additional,
  });

  @override
  List<Object> get props {
    return [
      success,
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
