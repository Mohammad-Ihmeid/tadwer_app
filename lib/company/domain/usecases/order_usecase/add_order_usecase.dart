import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';

class AddOrderParameters extends Equatable {
  final Order order;

  const AddOrderParameters(this.order);

  @override
  List<Object> get props => [order];
}
