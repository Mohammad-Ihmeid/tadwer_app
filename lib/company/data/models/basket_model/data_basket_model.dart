import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';

class DataBasketModel extends DataBasket {
  const DataBasketModel({
    required super.count,
    required super.wasteName,
    required super.isSelect,
    required super.basId,
    required super.wastId,
  });

  factory DataBasketModel.fromJson(Map<String, dynamic> json) =>
      DataBasketModel(
        count: (json["count"] ?? 0.0).toDouble(),
        wasteName: json["wasteName"] ?? "",
        isSelect: json["isSelect"] ?? false,
        basId: json["basId"] ?? 0,
        wastId: json["wastId"] ?? 0,
      );
}
