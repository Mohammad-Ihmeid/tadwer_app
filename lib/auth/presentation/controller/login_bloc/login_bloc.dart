import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final CheckLogInUseCase checkLogInUseCase;

  LoginBloc(this.checkLogInUseCase) : super(const LoginState()) {
    on<CheckLogInEvent>(_checkLogInEvent);
  }

  FutureOr<void> _checkLogInEvent(
      CheckLogInEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      requestState: RequestState.loading,
    ));
    final result = await checkLogInUseCase(
      CheckLogInParameters(name: event.name, password: event.password),
    );

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        errorMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestState: RequestState.success,
          user: r,
        ),
      );
    });
  }
}
