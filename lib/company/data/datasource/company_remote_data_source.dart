import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tadwer_app/company/data/models/category_model.dart';
import 'package:tadwer_app/company/data/models/waste_model.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/add_basket_usecase.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/network/api_constance.dart';
import 'package:tadwer_app/core/network/error_message_model.dart';
import 'package:tadwer_app/company/data/models/company_type_model.dart';

abstract class BaseCompanyRemoteDataSource {
  Future<List<CompanyTypeModel>> getAllCompanyType();

  Future<List<CategoryModel>> getAllCategory();

  Future<List<WasteModel>> getWasteByCategory(
      GetWasteByCategoryParameters parameters);

  Future<String> addBasket(AddBasketParameters parameters);
}

class CompanyRemoteDataSource extends BaseCompanyRemoteDataSource {
  @override
  Future<List<CompanyTypeModel>> getAllCompanyType() async {
    final response = await http.get(Uri.parse(ApiConstance.allCompanyTypePath));

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<CompanyTypeModel>.from(
        (responseJson as List).map(
          (e) => CompanyTypeModel.fromJson(e),
        ),
      );
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<CategoryModel>> getAllCategory() async {
    final response = await http.get(Uri.parse(ApiConstance.allCategoryPath));

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<CategoryModel>.from(
        (responseJson as List).map(
          (e) => CategoryModel.fromJson(e),
        ),
      );
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<WasteModel>> getWasteByCategory(
      GetWasteByCategoryParameters parameters) async {
    final response = await http.get(
      Uri.parse(
        ApiConstance.getWasteByCategoryPath(parameters.catId),
      ),
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<WasteModel>.from(
        (responseJson as List).map(
          (e) => WasteModel.fromJson(e),
        ),
      );
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<String> addBasket(AddBasketParameters parameters) async {
    final response = await http.post(
      Uri.parse(
        ApiConstance.addBasketPath,
      ),
      body: json.encode(parameters.addBasket.toModel().toJson()),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return responseJson;
    } else {
      var responseJson = json.decode(response.body);
      print(responseJson);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }
}
