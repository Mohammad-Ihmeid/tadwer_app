import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class CheckLogInUseCase extends BaseUseCase<User, CheckLogInParameters> {
  final BaseLogInRepository baseLogInRepository;

  CheckLogInUseCase(this.baseLogInRepository);

  @override
  Future<Either<Failure, User>> call(CheckLogInParameters parameters) async {
    return await baseLogInRepository.checkLogin(parameters);
  }
}

class CheckLogInParameters extends Equatable {
  final String name;
  final String password;

  const CheckLogInParameters({required this.name, required this.password});

  @override
  List<Object> get props => [name, password];
}
