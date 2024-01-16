part of 'recycling_request_bloc.dart';

sealed class RecyclingRequestEvent extends Equatable {}

class AddAdressEvent extends RecyclingRequestEvent {
  final String city;
  final String area;
  final String street;
  final String phone;
  final String buildNum;
  final String additional;

  AddAdressEvent({
    required this.city,
    required this.area,
    required this.street,
    required this.phone,
    required this.buildNum,
    required this.additional,
  });

  @override
  List<Object> get props => [
        city,
        area,
        street,
        phone,
        buildNum,
        additional,
      ];
}
