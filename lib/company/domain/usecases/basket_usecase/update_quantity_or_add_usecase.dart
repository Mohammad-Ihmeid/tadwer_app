import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/quantity.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class UpdateQuantityOrAddUseCase
    extends BaseUseCase<String, UpdateQuantityOrAddParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  UpdateQuantityOrAddUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, String>> call(
      UpdateQuantityOrAddParameters parameters) async {
    return await baseCompanyRepository.updateQuantityOrAdd(parameters);
  }
}

class UpdateQuantityOrAddParameters extends Equatable {
  final Quantity quantity;

  const UpdateQuantityOrAddParameters(this.quantity);

  @override
  List<Object?> get props => [quantity];
}
