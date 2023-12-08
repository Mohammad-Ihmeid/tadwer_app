part of 'company_type_bloc.dart';

class CompanyTypeState extends Equatable {
  final List<CompanyType> companyType;
  final CompanyTypeRequestState companyTypeRequestState;
  final String errorMessage;

  const CompanyTypeState({
    this.companyType = const [],
    this.companyTypeRequestState = CompanyTypeRequestState.loading,
    this.errorMessage = '',
  });

  CompanyTypeState copyWith({
    List<CompanyType>? companyType,
    CompanyTypeRequestState? companyTypeRequestState,
    String? errorMessage,
  }) {
    return CompanyTypeState(
      companyType: companyType ?? this.companyType,
      companyTypeRequestState:
          companyTypeRequestState ?? this.companyTypeRequestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        companyType,
        companyTypeRequestState,
        errorMessage,
      ];
}
