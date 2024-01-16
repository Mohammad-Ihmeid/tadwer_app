import 'package:tadwer_app/company/domain/entities/add_address.dart';

class AddAddressModel extends AddAddress {
  const AddAddressModel({
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
    json['UserRef'] = userRef;
    json['City'] = city;
    json['Area'] = area;
    json['Street'] = street;
    json['Phone'] = phone;
    json['BuildNum'] = buildNum;
    json['Additional'] = additional;
    return json;
  }
}
