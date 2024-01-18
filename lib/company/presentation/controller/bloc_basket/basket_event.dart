part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {}

class GetDataBasketEvent extends BasketEvent {
  @override
  List<Object> get props => [];
}
