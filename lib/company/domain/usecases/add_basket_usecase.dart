import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/add_basket.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class AddBasketUseCase extends BaseUseCase<String, AddBasketParameters> {
  BaseCompanyRepository baseCompanyRepository;

  AddBasketUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, String>> call(AddBasketParameters parameters) async {
    return await baseCompanyRepository.addBasket(parameters);
  }
}

class AddBasketParameters extends Equatable {
  final AddBasket addBasket;

  const AddBasketParameters({required this.addBasket});

  @override
  List<Object> get props => [addBasket];
}
