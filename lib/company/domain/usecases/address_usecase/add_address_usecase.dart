// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:tadwer_app/company/domain/entities/address_entities/add_address.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class AddUserAddressUseCase
    extends BaseUseCase<String, AddUserAddressParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  AddUserAddressUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, String>> call(
      AddUserAddressParameters parameters) async {
    return await baseCompanyRepository.addUserAddress(parameters);
  }
}

class AddUserAddressParameters extends Equatable {
  final AddAddress address;

  const AddUserAddressParameters(this.address);

  @override
  List<Object> get props => [address];
}
