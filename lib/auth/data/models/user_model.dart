import 'package:tadwer_app/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.isAdmin,
    required super.name,
    required super.password,
    required super.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        isAdmin: json["isAdmin"],
        name: json["name"],
        password: json["password"],
        id: json["id"],
      );
}
