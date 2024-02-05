import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/Dashboard/MainScreen/dashboard.dart';
import 'package:login_page/model/login_response/login_error_response.dart';
import 'package:login_page/model/login_response/login_success_response.dart';
import 'package:login_page/services/api_client.dart';
import 'package:login_page/storage/preferences.dart';
import 'package:login_page/utils/app_constants.dart';
import 'package:login_page/utils/general_helper.dart';
import 'package:login_page/utils/logs.dart';
import 'package:login_page/utils/utils.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  Future<bool> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    if (email.isEmpty) {
      GeneralHelper.snackBar(
          title: "Attention", message: "Email cannot be empty", isError: true);
    } else if (password.isEmpty) {
      GeneralHelper.snackBar(
          title: "Attention",
          message: "Password cannot be empty",
          isError: true);
    } else if (!Utils.isEmail(email)) {
      GeneralHelper.snackBar(
          title: "Attention",
          message: "Email is not in right format",
          isError: true);
    } else {
      isLoading = true;
      update();

      dio.Response response = await ApiClient.login(
          email: email, password: password, context: context);

      isLoading = false;
      update();
      if (response.statusCode == AppConstants.SUCCESS) {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

        String responseJson = json.encode(response.data);
        final loginSuccessResponse = loginSuccessResponseFromJson(responseJson);

        sharedPreferences.setString("token", loginSuccessResponse.data.token);
        logs("Login response $loginSuccessResponse");
        Get.to(() => const DashboardScreen());
        GeneralHelper.snackBar(
            title: "Congratulations", message: "Login Successfully");
        return true;
      } else if (response.statusCode! >= AppConstants.SERVER_SIDE_ERROR) {
        String responseJson = json.encode(response.data);

        final loginErrorResponse = loginErrorResponseFromJson(responseJson);
        GeneralHelper.snackBar(
            title: "Error", message: loginErrorResponse.message, isError: true);
        return false;
      } else if (response.statusCode! == AppConstants.UNAUTHORIZED) {
        String responseJson = json.encode(response.data);

        final loginErrorResponse = loginErrorResponseFromJson(responseJson);
        GeneralHelper.snackBar(
            title: "Error", message: loginErrorResponse.message, isError: true);
        return false;
      } else if (response.statusCode! == AppConstants.INTERNAL_SERVER_ERROR) {
        String responseJson = json.encode(response.data);

        final loginErrorResponse = loginErrorResponseFromJson(responseJson);
        GeneralHelper.snackBar(
            title: "Error", message: loginErrorResponse.message, isError: true);
        return false;
      }
    }

    return false;
  }
}
