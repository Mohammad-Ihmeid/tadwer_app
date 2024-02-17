part of 'recycling_request_bloc.dart';

sealed class RecyclingRequestEvent extends Equatable {}

class CheckAddressEvent extends RecyclingRequestEvent {
  @override
  List<Object> get props => [];
}

class GetDataBasketEvent extends RecyclingRequestEvent {
  @override
  List<Object> get props => [];
}

class RecyclingSaveEvent extends RecyclingRequestEvent {
  @override
  List<Object> get props => [];
}

class ChoosingDaysEvent extends RecyclingRequestEvent {
  final int indexDay;
  final bool dayValue;

  ChoosingDaysEvent(this.indexDay, this.dayValue);

  @override
  List<Object> get props => [indexDay, dayValue];
}
