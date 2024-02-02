import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import 'package:login_page/services/api_method.dart';
import 'package:login_page/utils/app_constants.dart';
import 'package:login_page/utils/logs.dart';


class ApiClient {
  ApiClient._internal();
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }
  //
  // static Future<dio.Response> registration(
  //     {
  //     required String fullName,
  //     required String companyName,
  //     required String email,
  //     required String phone,
  //     required String password,
  //     required String confirmPassword,
  //     required String referralCode,
  //     required List<double> latLong,
  //     required String imageFile}) async {
  //   var url = AppConstants.BASE_URL + AppConstants.REGISTRATION_URL;
  //   dio.Response response;
  //   response = await ApiMethods.postRequest({
  //     "Accept": "*/*",
  //     "Content-Type": "application/json"
  //   }, data: {
  //     "fullName": fullName,
  //     "companyName": companyName,
  //     "email": email,
  //     "phone": phone,
  //     "address": "Karachi",
  //     "latLong": [ 16.3, 11.4 ],
  //     "image": imageFile,
  //     "password": password,
  //     "confirmPassword": confirmPassword,
  //     "referralCode": referralCode
  //
  //   }, url: url);
  //   try {
  //     String responseJson = json.encode(response.data);
  //     logs(response.statusCode.toString());
  //     if (response.statusCode! == 200) {
  //       return response;
  //     }else {
  //       return response;
  //
  //     }
  //   } on dio.DioError catch (e) {
  //     if (e.message == "Receiving data timeout[50000ms]") {
  //       // return ("Please check your connection");
  //       return response;
  //
  //     }
  //     if (e.message == "Http status error [401]") {
  //       // return ("401");
  //       return response;
  //
  //     } else if (e.message == "Http status error [500]") {
  //       return response;
  //
  //       // return ("500");
  //     }
  //     // return (e.message!);
  //     return response;
  //
  //   }
  // }

  static Future<dio.Response> login({
    required String email,
    required String password,
  }) async {
    var url = AppConstants.BASE_URL + AppConstants.LOGIN_URL;
    dio.Response response;
    response = await ApiMethods.postRequest(
        {"Content-Type": "application/json"},
        data: {"email": email, "password": password}, url: url);

    try {
      logs(response.statusMessage.toString());
      if (response.statusCode! == 200) {
        return response;
      } else {
        return response;
      }
    } on dio.DioError catch (e) {
      if (e.message == "Receiving data timeout[50000ms]") {
        return response;
      }
      if (e.message == "Http status error [401]") {
        return response;
      } else if (e.message == "Http status error [500]") {
        return response;
      }
      return response;
    }
  }



  //
  // static Future<dio.Response> verifyOtp({
  //   required String phoneNumber,
  //   required String otpCode,
  // }) async {
  //   var url = AppConstants.BASE_URL + AppConstants.VERIFY_OTP;
  //   dio.Response response;
  //   response = await ApiMethods.postRequest(
  //       {
  //         "Authorization": "Bearer ${Preferences.getAuthId()}",
  //         "Content-Type": "application/json",
  //       },
  //       data: {"otp": otpCode}, url: url);
  //
  //   try {
  //     logs(response.statusMessage.toString());
  //     if (response.statusCode! == 200) {
  //       return response;
  //     } else {
  //       return response;
  //     }
  //   } on dio.DioError catch (e) {
  //     if (e.message == "Receiving data timeout[50000ms]") {
  //       return response;
  //     }
  //     if (e.message == "Http status error [401]") {
  //       return response;
  //     } else if (e.message == "Http status error [500]") {
  //       return response;
  //     }
  //     return response;
  //   }
  // }
  //
  static Future<dio.Response> getTasks() async {
    var url = AppConstants.BASE_URL + AppConstants.GET_TASKS;
    dio.Response response;
    response = await ApiMethods.getMethod(headers: {
      // "Authorization": "Bearer ${Preferences.getAuthId()}",
      "Content-Type": "application/json",
    }, url: url);
    try {
      String responseJson = json.encode(response.data);
      logs(response.statusCode.toString());
      if (response.statusCode! == 200) {
        return response;
      }else {
        return response;

      }
    } on dio.DioError catch (e) {
      if (e.message == "Receiving data timeout[50000ms]") {
        // return ("Please check your connection");
        return response;

      }
      if (e.message == "Http status error [401]") {
        // return ("401");
        return response;

      } else if (e.message == "Http status error [500]") {
        return response;

        // return ("500");
      }
      // return (e.message!);
      return response;

    }
  }

}
