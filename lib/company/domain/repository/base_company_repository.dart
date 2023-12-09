import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';

abstract class BaseCompanyRepository {
  Future<Either<Failure, List<CompanyType>>> getAllCompanyType();

  Future<Either<Failure, List<Category>>> getAllCategory();
}
