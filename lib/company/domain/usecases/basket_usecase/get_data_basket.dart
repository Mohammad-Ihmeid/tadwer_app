import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class GetDataBasketUseCase extends BaseUseCase<List<DataBasket>, NoParameters> {
  final BaseCompanyRepository baseCompanyRepository;

  GetDataBasketUseCase(this.baseCompanyRepository);
  @override
  Future<Either<Failure, List<DataBasket>>> call(
      NoParameters parameters) async {
    return await baseCompanyRepository.getDataBasket(parameters);
  }
}
