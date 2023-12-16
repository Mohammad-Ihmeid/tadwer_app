// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tadwer_app/company/data/datasource/company_remote_data_source.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/save_waste_det_usecase.dart';
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
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategory() async {
    try {
      final result = await baseCompanyRemoteDataSource.getAllCategory();
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, List<Waste>>> getWasteByCategory(
      GetWasteByCategoryParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.getWasteByCategory(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, String>> saveWasteDet(
      SaveWasteDetParameters parameters) async {
    try {
      final result = await baseCompanyRemoteDataSource.saveWasteDet(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }
}
