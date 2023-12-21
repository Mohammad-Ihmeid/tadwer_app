import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_all_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_all_company_type_usecase.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'company_type_event.dart';
part 'company_type_state.dart';

class CompanyTypeBloc extends Bloc<CompanyTypeEvent, CompanyTypeState> {
  final GetAllCompanyTypeUseCase getAllCompanyTypeUseCase;
  final GetAllCategoryUseCase getAllCategoryUseCase;
  final ConnectUserWithCompanyUseCase connectUserWithCompanyUseCase;
  CompanyTypeBloc(
    this.getAllCompanyTypeUseCase,
    this.getAllCategoryUseCase,
    this.connectUserWithCompanyUseCase,
  ) : super(const CompanyTypeState()) {
    on<GetAllCompanyTypeEvent>(_getAllCompanyTypeEvent);
    on<GetAllCategoryEvent>(_getAllCategoryEvent);
    on<ConnectUserWithCompanyEvent>((event, emit) async {
      emit(state.copyWith(connectCompanyState: BottomState.loading));

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final result = await connectUserWithCompanyUseCase(
        ConnectUserWithCompanyParameters(
          user: User(
            isAdmin: prefs.getBool("IsAdmin") ?? false,
            name: prefs.getString("UserName") ?? "",
            password: prefs.getString("Password") ?? "",
            id: prefs.getInt("Uid") ?? 0,
            compRef: event.compRef,
          ),
        ),
      );

      result.fold((l) {
        emit(state.copyWith(connectCompanyState: BottomState.error));
      }, (r) {
        emit(state.copyWith(connectCompanyState: BottomState.success));
      });
    });
  }

  FutureOr<void> _getAllCompanyTypeEvent(
      GetAllCompanyTypeEvent event, Emitter<CompanyTypeState> emit) async {
    final result = await getAllCompanyTypeUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        companyTypeRequestState: RequestState.error,
        errorMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          companyTypeRequestState: RequestState.loaded,
          companyType: r,
        ),
      );
    });
  }

  FutureOr<void> _getAllCategoryEvent(
      GetAllCategoryEvent event, Emitter<CompanyTypeState> emit) async {
    final result = await getAllCategoryUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        requestStateCategory: RequestState.error,
        errorMessageCategory: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          requestStateCategory: RequestState.loaded,
          categoryType: r,
        ),
      );
    });
  }
}
