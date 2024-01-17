import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/address.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class CheckUserAddressUseCase extends BaseUseCase<Address, NoParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  CheckUserAddressUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, Address>> call(NoParameters parameters) async {
    return await baseCompanyRepository.checkUserAddress(parameters);
  }
}
