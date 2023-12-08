import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/network/api_constance.dart';
import 'package:tadwer_app/core/network/error_message_model.dart';
import 'package:tadwer_app/company/data/models/company_type_model.dart';

abstract class BaseCompanyRemoteDataSource {
  Future<List<CompanyTypeModel>> getAllCompanyType();
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
}
