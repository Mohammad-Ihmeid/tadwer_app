// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/order_model/order_model.dart';

import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';

class Order extends Equatable {
  final List<DataBasket> basketList;
  final int daysNum;
  final int userId;

  const Order({
    required this.basketList,
    required this.daysNum,
    required this.userId,
  });

  OrderModel toModel() {
    return OrderModel(basketList: basketList, daysNum: daysNum, userId: userId);
  }

  @override
  List<Object> get props => [basketList, daysNum, userId];
}
