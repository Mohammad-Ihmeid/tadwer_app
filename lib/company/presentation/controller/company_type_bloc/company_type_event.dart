part of 'company_type_bloc.dart';

sealed class CompanyTypeEvent extends Equatable {}

class GetAllCompanyTypeEvent extends CompanyTypeEvent {
  @override
  List<Object?> get props => [];
}

class GetAllCategoryEvent extends CompanyTypeEvent {
  @override
  List<Object?> get props => [];
}

class ConnectUserWithCompanyEvent extends CompanyTypeEvent {
  final int compRef;

  ConnectUserWithCompanyEvent({required this.compRef});

  @override
  List<Object?> get props => [];
}
