import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/company/data/models/address_model.dart';
import 'package:tadwer_app/company/data/models/basket_model/data_basket_model.dart';
import 'package:tadwer_app/company/data/models/category_model.dart';
import 'package:tadwer_app/company/data/models/waste_model.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/add_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/address_usecase/update_address_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/connect_user_with_company_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_company_type_by_id_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/get_waste_by_category_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/add_basket_usecase.dart';
import 'package:tadwer_app/company/domain/usecases/basket_usecase/update_quantity_or_add_usecase.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/network/api_constance.dart';
import 'package:tadwer_app/core/network/error_message_model.dart';
import 'package:tadwer_app/company/data/models/company_type_model.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

abstract class BaseCompanyRemoteDataSource {
  Future<List<CompanyTypeModel>> getAllCompanyType();

  Future<CompanyTypeModel> getCompanyTypeById(
      GetCompanyTypeByIdParameters parameters);

  Future<List<CategoryModel>> getAllCategory();

  Future<List<WasteModel>> getWasteByCategory(
      GetWasteByCategoryParameters parameters);

  Future<String> connectUserWithCompany(
      ConnectUserWithCompanyParameters parameters);

  ////////////////////////////////////////////////////////////

  Future<List<DataBasketModel>> getDataBasket(NoParameters parameters);

  Future<bool> addBasket(AddBasketParameters parameters);

  Future<String> updateQuantityOrAdd(UpdateQuantityOrAddParameters parameters);

  ////////////////////////////////////////////////////////////

  Future<String> addUserAddress(AddUserAddressParameters parameters);

  Future<AddressModel> checkUserAddress(NoParameters parameters);

  Future<String> updateAddress(UpdateAddressParameters parameters);
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
  Future<CompanyTypeModel> getCompanyTypeById(
      GetCompanyTypeByIdParameters parameters) async {
    final response = await http.get(
      Uri.parse(
        ApiConstance.getCompanyTypeByIdPath(parameters.compId),
      ),
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return CompanyTypeModel.fromJson(responseJson);
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
  Future<bool> addBasket(AddBasketParameters parameters) async {
    debugPrint(ApiConstance.addBasketPath);
    debugPrint(json.encode(parameters.addBasket.toModel().toJson()));
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
      return responseJson["success"];
    } else {
      var responseJson = json.decode(response.body);
      debugPrint(responseJson);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<String> connectUserWithCompany(
      ConnectUserWithCompanyParameters parameters) async {
    final response = await http.put(
      Uri.parse(ApiConstance.updateUser),
      body: json.encode(parameters.user.toModel().toJson()),
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
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<String> updateQuantityOrAdd(
      UpdateQuantityOrAddParameters parameters) async {
    final response = await http.post(
      Uri.parse(ApiConstance.updateQuantityOrAddPath),
      body: json.encode(parameters.quantity.toModel().toJson()),
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
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<String> addUserAddress(AddUserAddressParameters parameters) async {
    final response = await http.post(
      Uri.parse(ApiConstance.addAddressPath),
      body: json.encode(parameters.address.toModel().toJson()),
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
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<AddressModel> checkUserAddress(NoParameters parameters) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(ApiConstance.checkUserAddressPath(prefs.getInt("Uid") ?? 0));
    final response = await http.get(
      Uri.parse(
        ApiConstance.checkUserAddressPath(prefs.getInt("Uid") ?? 0),
      ),
    );
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      if (responseJson["success"]) {
        return AddressModel.fromJson(responseJson);
      } else {
        return const AddressModel(
          success: false,
          addressId: 0,
          city: "",
          area: "",
          street: "",
          phone: "",
          buildNum: "",
          additional: "",
        );
      }
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<String> updateAddress(UpdateAddressParameters parameters) async {
    final response = await http.put(
      Uri.parse(ApiConstance.updateAddressPath),
      body: json.encode(parameters.updateAddress.toModel().toJson()),
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
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<List<DataBasketModel>> getDataBasket(NoParameters parameters) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(ApiConstance.getDataBasketPath(prefs.getInt("Uid") ?? 0)),
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return List<DataBasketModel>.from(
        (responseJson as List).map(
          (e) => DataBasketModel.fromJson(e),
        ),
      );
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }
}
