import 'package:dartz/dartz.dart';
import 'package:tadwer_app/auth/domain/entities/user_info.dart';
import 'package:tadwer_app/auth/domain/repository/base_login_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class GetUserInfoUseCase extends BaseUseCase<UserInfo, NoParameters> {
  GetUserInfoUseCase(this._baseLogInRepository);

  final BaseLogInRepository _baseLogInRepository;

  @override
  Future<Either<Failure, UserInfo>> call(NoParameters parameters) async {
    return await _baseLogInRepository.getUserInfo(parameters);
  }
}
