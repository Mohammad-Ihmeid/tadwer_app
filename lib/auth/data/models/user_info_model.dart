import 'package:tadwer_app/auth/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  const UserInfoModel({
    required super.userName,
    required super.password,
    required super.city,
    required super.area,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        userName: json['name'],
        password: json['password'],
        city: json['city'],
        area: json['area'],
      );

  const UserInfoModel.empty()
      : this(userName: '', password: '', city: '', area: '');
}
