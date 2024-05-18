// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tadwer_app/auth/data/datasource/auth_remote_data_source.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/entities/user_info.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class LogInRepository extends BaseLogInRepository {
  BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  LogInRepository(this.baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, User>> checkLogin(
      CheckLogInParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.checkLogIn(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserInfo>> getUserInfo(NoParameters parameters) async {
    try {
      final result = await baseAuthRemoteDataSource.getUserInfo(parameters);
      return Right(result);
    } on RemoteExceptions catch (failure) {
      return Left(RemoteFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
