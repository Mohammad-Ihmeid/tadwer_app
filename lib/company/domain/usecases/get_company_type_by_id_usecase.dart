import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class GetCompanyTypeByIdUseCase
    extends BaseUseCase<CompanyType, GetCompanyTypeByIdParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  GetCompanyTypeByIdUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, CompanyType>> call(
      GetCompanyTypeByIdParameters parameters) async {
    return await baseCompanyRepository.getCompanyTypeById(parameters);
  }
}

class GetCompanyTypeByIdParameters extends Equatable {
  final int compId;

  const GetCompanyTypeByIdParameters({required this.compId});

  @override
  List<Object?> get props => [compId];
}
