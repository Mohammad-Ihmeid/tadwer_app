// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String userName;
  final String password;
  final String city;
  final String area;

  const UserInfo({
    required this.userName,
    required this.password,
    required this.city,
    required this.area,
  });

  const UserInfo.empty() : this(userName: '', password: '', city: '', area: '');

  @override
  List<Object> get props => [userName, password, city, area];
}
