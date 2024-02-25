// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/basket_model/update_basket_model.dart';

class UpdateBasket extends Equatable {
  final int userRef;
  final int wastRef;
  final int basId;
  final double count;

  const UpdateBasket({
    required this.userRef,
    required this.wastRef,
    required this.basId,
    required this.count,
  });

  UpdateBasketModel toModel() {
    return UpdateBasketModel(
      userRef: userRef,
      wastRef: wastRef,
      basId: basId,
      count: count,
    );
  }

  @override
  List<Object> get props => [userRef, wastRef, basId, count];
}
