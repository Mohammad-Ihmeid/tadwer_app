import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class GetAllCategoryUseCase extends BaseUseCase<List<Category>, NoParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  GetAllCategoryUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, List<Category>>> call(NoParameters parameters) async {
    return baseCompanyRepository.getAllCategory();
  }
}
