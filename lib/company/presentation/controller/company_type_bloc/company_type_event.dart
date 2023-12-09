part of 'company_type_bloc.dart';

sealed class CompanyTypeEvent extends Equatable {
  const CompanyTypeEvent();

  @override
  List<Object> get props => [];
}

class GetAllCompanyTypeEvent extends CompanyTypeEvent {}

class GetAllCategoryEvent extends CompanyTypeEvent {}
