import 'package:tadwer_app/company/domain/entities/waste_entities/add_basket.dart';

class AddBasketModel extends AddBasket {
  const AddBasketModel({
    required super.userRef,
    required super.wastRef,
    required super.count,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['userRef'] = userRef;
    json['wastRef'] = wastRef;
    json['Count'] = count;
    return json;
  }
}
