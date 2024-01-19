import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class DeleteBasketByWestUseCase
    extends BaseUseCase<bool, DeleteBasketByWestParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  DeleteBasketByWestUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, bool>> call(
      DeleteBasketByWestParameters parameters) async {
    return await baseCompanyRepository.deleteBasketByWest(parameters);
  }
}

class DeleteBasketByWestParameters extends Equatable {
  final int wastRef;

  const DeleteBasketByWestParameters(this.wastRef);

  @override
  List<Object?> get props => [wastRef];
}
