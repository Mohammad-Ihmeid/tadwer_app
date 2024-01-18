import 'package:tadwer_app/company/domain/entities/waste_entities/quantity.dart';

class QuantityModel extends Quantity {
  const QuantityModel({
    required super.count,
    required super.weight,
    required super.westRef,
    required super.uId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['Count'] = count;
    json['Weight'] = weight;
    json['WestRef'] = westRef;
    json['UId'] = uId;
    return json;
  }
}
