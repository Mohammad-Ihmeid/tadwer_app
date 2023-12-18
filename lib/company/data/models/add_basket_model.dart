import 'package:tadwer_app/company/domain/entities/add_basket.dart';

class AddBasketModel extends AddBasket {
  const AddBasketModel({
    required super.basId,
    required super.userRef,
    required super.wastRef,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['basId'] = basId;
    json['userRef'] = userRef;
    json['wastRef'] = wastRef;
    return json;
  }
}
