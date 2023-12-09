part of 'company_type_bloc.dart';

class CompanyTypeState extends Equatable {
  final List<CompanyType> companyType;
  final RequestState companyTypeRequestState;
  final String errorMessage;
  final List<Category> categoryType;
  final RequestState requestStateCategory;
  final String errorMessageCategory;

  const CompanyTypeState({
    this.companyType = const [],
    this.companyTypeRequestState = RequestState.loading,
    this.errorMessage = '',
    this.categoryType = const [],
    this.requestStateCategory = RequestState.loading,
    this.errorMessageCategory = '',
  });

  CompanyTypeState copyWith({
    List<CompanyType>? companyType,
    RequestState? companyTypeRequestState,
    String? errorMessage,
    List<Category>? categoryType,
    RequestState? requestStateCategory,
    String? errorMessageCategory,
  }) {
    return CompanyTypeState(
      companyType: companyType ?? this.companyType,
      companyTypeRequestState:
          companyTypeRequestState ?? this.companyTypeRequestState,
      errorMessage: errorMessage ?? this.errorMessage,
      categoryType: categoryType ?? this.categoryType,
      requestStateCategory: requestStateCategory ?? this.requestStateCategory,
      errorMessageCategory: errorMessageCategory ?? this.errorMessageCategory,
    );
  }

  @override
  List<Object?> get props => [
        companyType,
        companyTypeRequestState,
        errorMessage,
        categoryType,
        requestStateCategory,
        errorMessageCategory,
      ];
}
