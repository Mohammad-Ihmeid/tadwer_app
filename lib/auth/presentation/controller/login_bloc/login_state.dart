part of 'login_bloc.dart';

class LoginState extends Equatable {
  final User? user;
  final SignInRequestState requestState;
  final String errorMessage;

  const LoginState({
    this.user,
    this.requestState = SignInRequestState.normal,
    this.errorMessage = '',
  });

  LoginState copyWith({
    User? user,
    SignInRequestState? requestState,
    String? errorMessage,
  }) {
    return LoginState(
      user: user ?? this.user,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [user, requestState, errorMessage];
}
