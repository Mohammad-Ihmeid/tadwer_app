import 'package:tadwer_app/company/domain/entities/basket_entities/update_basket.dart';

class UpdateBasketModel extends UpdateBasket {
  const UpdateBasketModel({
    required super.userRef,
    required super.wastRef,
    required super.basId,
    required super.count,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json["UserRef"] = userRef;
    json["WastRef"] = wastRef;
    json["BasId"] = basId;
    json["Count"] = count;
    return json;
  }
}
