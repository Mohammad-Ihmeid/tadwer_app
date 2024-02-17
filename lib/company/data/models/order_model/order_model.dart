import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';

class OrderModel extends OrderRequest {
  const OrderModel({
    required super.basketId,
    required super.daysNum,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['basketId'] = basketId;
    json['DaysNum'] = daysNum;
    json['UserId'] = userId;
    return json;
  }
}
