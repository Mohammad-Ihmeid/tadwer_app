part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();
}

class GetDataBasketEvent extends BasketEvent {
  @override
  List<Object> get props => [];
}

class DeleteBasketByWestEvent extends BasketEvent {
  final int wastRef;

  const DeleteBasketByWestEvent(this.wastRef);
  @override
  List<Object> get props => [wastRef];
}

class ShowWasteDetEvent extends BasketEvent {
  final int westRef;

  const ShowWasteDetEvent(this.westRef);

  @override
  List<Object?> get props => [westRef];
}

class UpdateBasketEvent extends BasketEvent {
  final int wastRef;

  const UpdateBasketEvent(this.wastRef);
  @override
  List<Object> get props => [wastRef];
}
