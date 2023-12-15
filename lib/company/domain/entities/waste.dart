// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Waste extends Equatable {
  final int id;
  final String wasteName;

  const Waste({required this.id, required this.wasteName});

  @override
  List<Object> get props => [id, wasteName];
}
