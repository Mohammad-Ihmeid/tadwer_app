// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class SignUpUseCase extends BaseUseCase<bool, SignUpParameters> {
  SignUpUseCase(this._baseLogInRepository);

  final BaseLogInRepository _baseLogInRepository;

  @override
  Future<Either<Failure, bool>> call(SignUpParameters parameters) async {
    return await _baseLogInRepository.signUp(parameters);
  }
}

class SignUpParameters extends Equatable {
  final String userName;
  final String password;

  const SignUpParameters({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}
