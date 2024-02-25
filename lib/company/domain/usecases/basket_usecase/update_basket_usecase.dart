// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/update_basket.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class UpdateBasketUseCase extends BaseUseCase<String, UpdateBasketParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  UpdateBasketUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, String>> call(
      UpdateBasketParameters parameters) async {
    return await baseCompanyRepository.updateBasket(parameters);
  }
}

class UpdateBasketParameters extends Equatable {
  final UpdateBasket updateBasket;

  const UpdateBasketParameters(this.updateBasket);

  @override
  List<Object> get props => [updateBasket];
}
