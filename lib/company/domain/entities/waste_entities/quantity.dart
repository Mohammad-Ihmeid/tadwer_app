// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/data/models/basket_model/quantity_model.dart';

class Quantity extends Equatable {
  final double count;
  final double weight;
  final int westRef;
  final int uId;

  const Quantity({
    required this.count,
    required this.weight,
    required this.westRef,
    required this.uId,
  });

  QuantityModel toModel() {
    return QuantityModel(
      count: count,
      weight: weight,
      westRef: westRef,
      uId: uId,
    );
  }

  @override
  List<Object> get props => [count, weight, westRef, uId];
}
