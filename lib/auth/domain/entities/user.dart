// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/auth/data/models/user_model.dart';

class User extends Equatable {
  final bool isAdmin;
  final String name;
  final String password;
  final int id;
  final int compRef;

  const User({
    required this.isAdmin,
    required this.name,
    required this.password,
    required this.id,
    required this.compRef,
  });

  UserModel toModel() {
    return UserModel(
      isAdmin: isAdmin,
      name: name,
      password: password,
      id: id,
      compRef: compRef,
    );
  }

  @override
  List<Object> get props => [
        isAdmin,
        name,
        password,
        id,
        compRef,
      ];
}
