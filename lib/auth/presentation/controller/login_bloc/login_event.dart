part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class CheckLogInEvent extends LoginEvent {
  final String name;
  final String password;

  const CheckLogInEvent({required this.name, required this.password});

  @override
  List<Object?> get props => [name, password];
}
