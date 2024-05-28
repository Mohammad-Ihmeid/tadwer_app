import 'package:dartz/dartz.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/entities/user_info.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:tadwer_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

abstract class BaseLogInRepository {
  Future<Either<Failure, User>> checkLogin(CheckLogInParameters parameters);

  Future<Either<Failure, bool>> signUp(SignUpParameters parameters);

  Future<Either<Failure, UserInfo>> getUserInfo(NoParameters parameters);
}
