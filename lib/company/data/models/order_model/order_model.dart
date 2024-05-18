import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';

class OrderModel extends OrderRequest {
  const OrderModel({
    required super.basketId,
    required super.daysNum,
    required super.userId,
    required super.note,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['daysNum'] = daysNum;
    json['userId'] = userId;
    json['basketId'] = basketId;
    json['note'] = note;
    return json;
  }
}
