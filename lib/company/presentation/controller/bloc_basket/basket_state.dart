part of 'basket_bloc.dart';

sealed class BasketState extends Equatable {
  const BasketState();
  
  @override
  List<Object> get props => [];
}

final class BasketInitial extends BasketState {}
