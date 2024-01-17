import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/update_address.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class UpdateAddressUseCase
    extends BaseUseCase<String, UpdateAddressParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  UpdateAddressUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, String>> call(
      UpdateAddressParameters parameters) async {
    return await baseCompanyRepository.updateAddress(parameters);
  }
}

class UpdateAddressParameters extends Equatable {
  final UpdateAddress updateAddress;

  const UpdateAddressParameters(this.updateAddress);

  @override
  List<Object> get props => [updateAddress];
}
