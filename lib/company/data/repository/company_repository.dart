// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tadwer_app/company/data/datasource/company_remote_data_source.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/address.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/add_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/update_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/delete_basket_by_west_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/update_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_company_type_by_id_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/add_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/order_usecase/add_order_usecase.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

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
  Future<Either<Failure, bool>> addBasket(
      AddBasketParameters parameters) async {
    try {
      final result = await baseCompanyRemoteDataSource.addBasket(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, String>> connectUserWithCompany(
      ConnectUserWithCompanyParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.connectUserWithCompany(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, CompanyType>> getCompanyTypeById(
      GetCompanyTypeByIdParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.getCompanyTypeById(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, String>> addUserAddress(
      AddUserAddressParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.addUserAddress(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, Address>> checkUserAddress(
      NoParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.checkUserAddress(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, String>> updateAddress(
      UpdateAddressParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.updateAddress(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, List<DataBasket>>> getDataBasket(
      NoParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.getDataBasket(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteBasketByWest(
      DeleteBasketByWestParameters parameters) async {
    try {
      final result =
          await baseCompanyRemoteDataSource.deleteBasketByWest(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, bool>> addOrder(AddOrderParameters parameters) async {
    try {
      final result = await baseCompanyRemoteDataSource.addOrder(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }

  @override
  Future<Either<Failure, String>> updateBasket(
      UpdateBasketParameters parameters) async {
    try {
      final result = await baseCompanyRemoteDataSource.updateBasket(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    } catch (e) {
      return const Left(RemoteFailure("حدث خطأ برمجي الرجاء المحاولة لاحقا"));
    }
  }
}
