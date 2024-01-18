// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/basket_model/add_basket_model.dart';

class AddBasket extends Equatable {
  final int userRef;
  final int wastRef;
  final int count;

  const AddBasket({
    required this.userRef,
    required this.wastRef,
    required this.count,
  });

  AddBasketModel toModel() {
    return AddBasketModel(
      userRef: userRef,
      wastRef: wastRef,
      count: count,
    );
  }

  @override
  List<Object> get props => [userRef, wastRef, count];
}
