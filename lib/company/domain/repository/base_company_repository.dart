import 'package:dartz/dartz.dart';
import 'package:tadwer_app/company/domain/entities/address_entities/address.dart';
import 'package:tadwer_app/company/domain/entities/basket_entities/data_basket.dart';
import 'package:tadwer_app/company/domain/entities/category.dart';
import 'package:tadwer_app/company/domain/entities/waste_entities/waste.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/add_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/update_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_company_type_by_id_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/add_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/update_quantity_or_add_usecase.dart';
import 'package:tadwer_app/core/error/failure.dart';
import 'package:tadwer_app/company/domain/entities/company_type.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

abstract class BaseCompanyRepository {
  Future<Either<Failure, List<CompanyType>>> getAllCompanyType();

  Future<Either<Failure, CompanyType>> getCompanyTypeById(
      GetCompanyTypeByIdParameters parameters);

  Future<Either<Failure, List<Category>>> getAllCategory();

  Future<Either<Failure, List<Waste>>> getWasteByCategory(
      GetWasteByCategoryParameters parameters);

  Future<Either<Failure, bool>> addBasket(AddBasketParameters parameters);

  Future<Either<Failure, String>> connectUserWithCompany(
      ConnectUserWithCompanyParameters parameters);

  Future<Either<Failure, String>> updateQuantityOrAdd(
      UpdateQuantityOrAddParameters parameters);

  ///////////////////////////////////////////////////

  Future<Either<Failure, List<DataBasket>>> getDataBasket(
      NoParameters parameters);

  ///////////////////////////////////////////////////

  Future<Either<Failure, String>> addUserAddress(
      AddUserAddressParameters parameters);

  Future<Either<Failure, Address>> checkUserAddress(NoParameters parameters);

  Future<Either<Failure, String>> updateAddress(
      UpdateAddressParameters parameters);
}
