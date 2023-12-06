import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tadwer_app/auth/data/models/user_model.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/network/api_constance.dart';
import 'package:tadwer_app/core/network/error_message_model.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> checkLogIn(CheckLogInParameters parameters);
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  @override
  Future<UserModel> checkLogIn(CheckLogInParameters parameters) async {
    debugPrint(
        Uri.parse(ApiConstance.checkLogInPath(parameters.name)).toString());
    final response = await http.post(
      Uri.parse(ApiConstance.checkLogInPath(parameters.name)),
      body: json.encode(parameters.password),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return UserModel.fromJson(responseJson);
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }
}
