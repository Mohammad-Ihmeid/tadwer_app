part of 'login_bloc.dart';

class LoginState extends Equatable {
  final User? user;
  final SignInRequestState requestState;
  final RequestState requestSplashState;
  final String errorMessage;
  ///////////////////////////////////////
  final UserInfo userInfo;
  final RequestState userInfoState;
  final String userInfoError;

  const LoginState({
    this.user,
    this.requestState = SignInRequestState.normal,
    this.requestSplashState = RequestState.loading,
    this.errorMessage = '',
    ///////////////////////////////////////
    this.userInfo = const UserInfo.empty(),
    this.userInfoState = RequestState.loading,
    this.userInfoError = '',
  });

  LoginState copyWith({
    User? user,
    SignInRequestState? requestState,
    RequestState? requestSplashState,
    String? errorMessage,
    ///////////////////////////////////////
    UserInfo? userInfo,
    RequestState? userInfoState,
    String? userInfoError,
  }) {
    return LoginState(
      user: user ?? this.user,
      requestState: requestState ?? this.requestState,
      requestSplashState: requestSplashState ?? this.requestSplashState,
      errorMessage: errorMessage ?? this.errorMessage,
      ///////////////////////////////////////
      userInfo: userInfo ?? this.userInfo,
      userInfoState: userInfoState ?? this.userInfoState,
      userInfoError: userInfoError ?? this.userInfoError,
    );
  }

  @override
  List<Object?> get props => [
        user,
        requestState,
        requestSplashState,
        errorMessage,
        ///////////////////////////////////////
        userInfo,
        userInfoState,
        userInfoError,
      ];
}
