import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class GetWasteByCategoryUseCase
    extends BaseUseCase<List<Waste>, GetWasteByCategoryParameters> {
  BaseCompanyRepository baseCompanyRepository;

  GetWasteByCategoryUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, List<Waste>>> call(
      GetWasteByCategoryParameters parameters) async {
    return await baseCompanyRepository.getWasteByCategory(parameters);
  }
}

class GetWasteByCategoryParameters extends Equatable {
  final int catId;

  const GetWasteByCategoryParameters({required this.catId});

  @override
  List<Object> get props => [catId];
}
