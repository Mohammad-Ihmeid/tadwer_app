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
