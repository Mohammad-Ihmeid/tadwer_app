import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/entities/user_info.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/auth/domain/usecases/get_user_info_usecase.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final CheckLogInUseCase checkLogInUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  LoginBloc(this.checkLogInUseCase, this.getUserInfoUseCase)
      : super(const LoginState()) {
    on<CheckLogInEvent>(_checkLogInEvent);
    on<SplashCheckLogInEvent>(_splashCheckLogInEvent);
    on<GetUserInfoEvent>(_getUserInfoEvent);
  }

  FutureOr<void> _getUserInfoEvent(GetUserInfoEvent event, emit) async {
    emit(state.copyWith(userInfoState: RequestState.loading));

    final result = await getUserInfoUseCase(const NoParameters());

    result.fold(
      (error) => emit(state.copyWith(
          userInfoError: error.message, userInfoState: RequestState.error)),
      (userData) => emit(
        state.copyWith(userInfo: userData, userInfoState: RequestState.loaded),
      ),
    );
  }

  FutureOr<void> _checkLogInEvent(
      CheckLogInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      requestState: SignInRequestState.loading,
    ));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await checkLogInUseCase(
      CheckLogInParameters(name: event.name, password: event.password),
    );

    result.fold((l) {
      emit(state.copyWith(
        requestState: SignInRequestState.error,
        errorMessage: l.message,
      ));
    }, (r) {
      prefs.setString("UserName", r.name);
      prefs.setString("Password", r.password);
      prefs.setInt("Uid", r.id);
      prefs.setInt("CompRef", r.compRef);
      prefs.setBool("IsAdmin", r.isAdmin);
      emit(
        state.copyWith(
          requestState: SignInRequestState.success,
          user: r,
        ),
      );
    });
  }

  FutureOr<void> _splashCheckLogInEvent(
      SplashCheckLogInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      requestSplashState: RequestState.loading,
    ));
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = await checkLogInUseCase(
      CheckLogInParameters(
        name: prefs.getString("UserName") ?? "mdsopvmmvpodsf",
        password: prefs.getString("Password") ?? "vdsfamvmadf",
      ),
    );

    result.fold((l) {
      emit(state.copyWith(
        requestSplashState: RequestState.error,
        errorMessage: l.message,
      ));
    }, (r) {
      prefs.setString("UserName", r.name);
      prefs.setString("Password", r.password);
      prefs.setInt("Uid", r.id);
      prefs.setInt("CompRef", r.compRef);
      prefs.setBool("IsAdmin", r.isAdmin);
      emit(
        state.copyWith(
          requestSplashState: RequestState.loaded,
          user: r,
        ),
      );
    });
  }
}
