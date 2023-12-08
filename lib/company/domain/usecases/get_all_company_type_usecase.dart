import 'package:dartz/dartz.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';

class GetAllCompanyTypeUseCase
    extends BaseUseCase<List<CompanyType>, NoParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  GetAllCompanyTypeUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, List<CompanyType>>> call(
      NoParameters parameters) async {
    return await baseCompanyRepository.getAllCompanyType();
  }
}
