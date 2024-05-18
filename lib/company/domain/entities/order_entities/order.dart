// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/order_model/order_model.dart';

class OrderRequest extends Equatable {
  final int basketId;
  final List<int> daysNum;
  final int userId;
  final String note;

  const OrderRequest({
    required this.basketId,
    required this.daysNum,
    required this.userId,
    required this.note,
  });

  OrderModel toModel() {
    return OrderModel(
      basketId: basketId,
      daysNum: daysNum,
      userId: userId,
      note: note,
    );
  }

  @override
  List<Object> get props => [basketId, daysNum, userId, note];
}
