part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {}

class GetDataBasketEvent extends BasketEvent {
  @override
  List<Object> get props => [];
}

class DeleteBasketByWestEvent extends BasketEvent {
  final int wastRef;

  DeleteBasketByWestEvent(this.wastRef);
  @override
  List<Object> get props => [wastRef];
}
