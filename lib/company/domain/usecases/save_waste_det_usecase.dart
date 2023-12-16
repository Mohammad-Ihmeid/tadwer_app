import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tadwer_app/company/domain/entities/save_waste_det.dart';
import 'package:tadwer_app/company/domain/repository/base_company_repository.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

class SaveWasteDetUseCase extends BaseUseCase<String, SaveWasteDetParameters> {
  BaseCompanyRepository baseCompanyRepository;

  SaveWasteDetUseCase(this.baseCompanyRepository);

  @override
  Future<Either<Failure, String>> call(
      SaveWasteDetParameters parameters) async {
    return await baseCompanyRepository.saveWasteDet(parameters);
  }
}

class SaveWasteDetParameters extends Equatable {
  final SaveWasteDet wasteDet;

  const SaveWasteDetParameters({required this.wasteDet});

  @override
  List<Object> get props => [wasteDet];
}
