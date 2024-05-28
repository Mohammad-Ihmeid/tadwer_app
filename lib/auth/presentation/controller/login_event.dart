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

class SplashCheckLogInEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class GetUserInfoEvent extends LoginEvent {
  const GetUserInfoEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends LoginEvent {
  final String userName;
  final String password;
  final String confirmPassword;

  const SignUpEvent({
    required this.userName,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [
        userName,
        password,
        confirmPassword,
      ];
}
