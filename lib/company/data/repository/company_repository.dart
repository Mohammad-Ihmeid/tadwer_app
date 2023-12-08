// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tadwer_app/company/data/datasource/company_remote_data_source.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/error/failure.dart';

class CompanyRepository extends BaseCompanyRepository {
  BaseCompanyRemoteDataSource baseCompanyRemoteDataSource;
  CompanyRepository(this.baseCompanyRemoteDataSource);
  @override
  Future<Either<Failure, List<CompanyType>>> getAllCompanyType() async {
    try {
      final result = await baseCompanyRemoteDataSource.getAllCompanyType();
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    }
  }
}