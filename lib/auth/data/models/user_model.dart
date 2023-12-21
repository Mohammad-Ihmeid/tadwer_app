import 'package:tadwer_app/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.isAdmin,
    required super.name,
    required super.password,
    required super.id,
    required super.compRef,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        isAdmin: json["isAdmin"],
        name: json["name"],
        password: json["password"],
        id: json["uid"],
        compRef: json["compRef"] ?? 0,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['isAdmin'] = isAdmin;
    json['name'] = name;
    json['password'] = password;
    json['uid'] = id;
    json['compRef'] = compRef;
    return json;
  }
}
