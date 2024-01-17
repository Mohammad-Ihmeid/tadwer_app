import 'package:tadwer_app/company/domain/entities/address_entities/address.dart';

class AddressModel extends Address {
  const AddressModel({
    required super.success,
    required super.addressId,
    required super.city,
    required super.area,
    required super.street,
    required super.phone,
    required super.buildNum,
    required super.additional,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        success: json["success"],
        addressId: json["addresses"]["addressId"] ?? 0,
        city: json["addresses"]["city"] ?? "",
        area: json["addresses"]["area"] ?? "",
        street: json["addresses"]["street"] ?? "",
        phone: json["addresses"]["phone"] ?? "",
        buildNum: json["addresses"]["buildNum"] ?? "",
        additional: json["addresses"]["additional"] ?? "",
      );
}
