import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/entities/waste.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/add_basket_usecase.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';

abstract class BaseCompanyRepository {
  Future<Either<Failure, List<CompanyType>>> getAllCompanyType();

  Future<Either<Failure, List<Category>>> getAllCategory();

  Future<Either<Failure, List<Waste>>> getWasteByCategory(
      GetWasteByCategoryParameters parameters);

  Future<Either<Failure, String>> addBasket(AddBasketParameters parameters);

  Future<Either<Failure, String>> connectUserWithCompany(
      ConnectUserWithCompanyParameters parameters);
}
