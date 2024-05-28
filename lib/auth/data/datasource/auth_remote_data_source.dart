import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadwer_app/auth/data/models/user_info_model.dart';
import 'package:tadwer_app/auth/data/models/user_model.dart';
import 'package:tadwer_app/auth/domain/usecases/check_login_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:tadwer_app/auth/domain/usecases/sign_up_usecase.dart';
import 'package:tadwer_app/core/error/exceptions.dart';
import 'package:tadwer_app/core/network/api_constance.dart';
import 'package:tadwer_app/core/network/error_message_model.dart';
import 'package:tadwer_app/core/usecase/base_usecase.dart';

abstract class BaseAuthRemoteDataSource {
  Future<UserModel> checkLogIn(CheckLogInParameters parameters);

  Future<UserInfoModel> getUserInfo(NoParameters parameters);

  Future<bool> signUp(SignUpParameters parameters);
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

  @override
  Future<UserInfoModel> getUserInfo(NoParameters parameters) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt("Uid") ?? 0;
    final response = await http.get(
      Uri.parse(ApiConstance.getUserInfoPath(uid)),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      List<UserInfoModel> listData = List<UserInfoModel>.from(
        (responseJson as List).map(
          (e) => UserInfoModel.fromJson(e),
        ),
      );
      if (listData.isEmpty) {
        return const UserInfoModel.empty();
      } else {
        return listData.first;
      }
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }

  @override
  Future<bool> signUp(SignUpParameters parameters) async {
    final response = await http.post(
      Uri.parse(ApiConstance.signUpPath),
      body: json.encode(
        {
          "uid": 0,
          "name": parameters.userName,
          "password": parameters.password,
          "isAdmin": false
        },
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var responseJson = jsonDecode(response.body);
      return responseJson["success"];
    } else {
      var responseJson = json.decode(response.body);
      throw RemoteExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(responseJson),
      );
    }
  }
}
