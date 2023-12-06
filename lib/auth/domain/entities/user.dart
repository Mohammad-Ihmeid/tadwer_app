// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final bool isAdmin;
  final String name;
  final String password;
  final int id;

  const User(
      {required this.isAdmin,
      required this.name,
      required this.password,
      required this.id});

  @override
  List<Object> get props => [isAdmin, name, password, id];
}
