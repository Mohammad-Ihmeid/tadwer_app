import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final CheckLogInUseCase checkLogInUseCase;

  LoginBloc(this.checkLogInUseCase) : super(const LoginState()) {
    on<CheckLogInEvent>(_checkLogInEvent);
    on<SplashCheckLogInEvent>(_splashCheckLogInEvent);
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
      prefs.setInt("UID", r.id);
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
      emit(
        state.copyWith(
          requestSplashState: RequestState.loaded,
          user: r,
        ),
      );
    });
  }
}
