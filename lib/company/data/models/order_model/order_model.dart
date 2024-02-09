import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.basketList,
    required super.daysNum,
    required super.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['BasketList'] = basketList;
    json['DaysNum'] = daysNum;
    json['UserId'] = userId;
    return json;
  }
}
