import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/usecases/get_all_company_type_usecase.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/core/utils/enums.dart';

part 'company_type_event.dart';
part 'company_type_state.dart';

class CompanyTypeBloc extends Bloc<CompanyTypeEvent, CompanyTypeState> {
  final GetAllCompanyTypeUseCase getAllCompanyTypeUseCase;
  CompanyTypeBloc(this.getAllCompanyTypeUseCase)
      : super(const CompanyTypeState()) {
    on<GetAllCompanyTypeEvent>(_getAllCompanyTypeEvent);
  }

  FutureOr<void> _getAllCompanyTypeEvent(
      GetAllCompanyTypeEvent event, Emitter<CompanyTypeState> emit) async {
    final result = await getAllCompanyTypeUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
        companyTypeRequestState: CompanyTypeRequestState.error,
        errorMessage: l.message,
      ));
    }, (r) {
      emit(
        state.copyWith(
          companyTypeRequestState: CompanyTypeRequestState.loaded,
          companyType: r,
        ),
      );
    });
  }
}
