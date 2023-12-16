part of 'login_bloc.dart';

class LoginState extends Equatable {
  final User? user;
  final SignInRequestState requestState;
  final RequestState requestSplashState;
  final String errorMessage;

  const LoginState({
    this.user,
    this.requestState = SignInRequestState.normal,
    this.requestSplashState = RequestState.loading,
    this.errorMessage = '',
  });

  LoginState copyWith({
    User? user,
    SignInRequestState? requestState,
    RequestState? requestSplashState,
    String? errorMessage,
  }) {
    return LoginState(
      user: user ?? this.user,
      requestState: requestState ?? this.requestState,
      requestSplashState: requestSplashState ?? this.requestSplashState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        user,
        requestState,
        requestSplashState,
        errorMessage,
      ];
}
