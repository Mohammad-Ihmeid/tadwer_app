import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/order_entities/order.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class AddOrderUseCase extends BaseUseCase<String, AddOrderParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  AddOrderUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, String>> call(AddOrderParameters parameters) async {
    return baseCompanyRepository.addOrder(parameters);
  }
}

class AddOrderParameters extends Equatable {
  final OrderRequest order;

  const AddOrderParameters(this.order);

  @override
  List<Object> get props => [order];
}
