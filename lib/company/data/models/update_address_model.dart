import 'package:tadwer_app/company/domain/entities/address_entities/update_address.dart';

class UpdateAddressModel extends UpdateAddress {
  const UpdateAddressModel({
    required super.addressId,
    required super.userRef,
    required super.city,
    required super.area,
    required super.street,
    required super.phone,
    required super.buildNum,
    required super.additional,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['addressId'] = addressId;
    json['userRef'] = userRef;
    json['City'] = city;
    json['Area'] = area;
    json['Street'] = street;
    json['Phone'] = phone;
    json['BuildNum'] = buildNum;
    json['Additional'] = additional;
    return json;
  }
}
