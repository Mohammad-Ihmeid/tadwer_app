// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/add_basket_model.dart';

class AddBasket extends Equatable {
  final int basId;
  final int userRef;
  final int wastRef;

  const AddBasket({
    required this.basId,
    required this.userRef,
    required this.wastRef,
  });

  AddBasketModel toModel() {
    return AddBasketModel(
      basId: basId,
      userRef: userRef,
      wastRef: wastRef,
    );
  }

  @override
  List<Object> get props => [basId, userRef, wastRef];
}
