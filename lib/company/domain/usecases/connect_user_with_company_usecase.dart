import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/auth/domain/entities/user.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class ConnectUserWithCompanyUseCase
    extends BaseUseCase<String, ConnectUserWithCompanyParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  ConnectUserWithCompanyUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, String>> call(
      ConnectUserWithCompanyParameters parameters) async {
    return await baseCompanyRepository.connectUserWithCompany(parameters);
  }
}

class ConnectUserWithCompanyParameters extends Equatable {
  final User user;

  const ConnectUserWithCompanyParameters({required this.user});

  @override
  List<Object> get props => [user];
}
