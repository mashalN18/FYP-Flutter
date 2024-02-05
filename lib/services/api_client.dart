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
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/preferences.dart';


class ApiClient {

  static Future<dio.Response> login({
    required String email,
    required String password, required BuildContext context,
  }) async {
    var url = AppConstants.BASE_URL + AppConstants.LOGIN_URL;
    dio.Response response;
    response = await ApiMethods.postRequest(
        {
          // "Authorization": "Bearer 1|68CBxqGnar60LnDD8kOwTDxOyROZawPDouHQkZy0",
          "Content-Type": "application/json"

        },
        data: {"email": email, "password": password}, url: url);

    try {
      logs("this is ${response.statusMessage.toString()}");
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



  static Future<dio.Response> getTasks() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = AppConstants.BASE_URL + AppConstants.GET_TASKS;
    dio.Response response;
    response = await ApiMethods.getMethod(headers: {
      "Authorization": "Bearer ${sharedPreferences.getString("token")}",
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

  static Future<dio.Response> getLeaves() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = AppConstants.BASE_URL + AppConstants.GET_LEAVES;
    dio.Response response;
    response = await ApiMethods.getMethod(headers: {
      "Authorization": "Bearer ${sharedPreferences.getString("token")}",
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

  static Future<dio.Response> getPerformance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = AppConstants.BASE_URL + AppConstants.GET_PERFORMANCE;
    dio.Response response;
    response = await ApiMethods.getMethod(headers: {
      "Authorization": "Bearer ${sharedPreferences.getString("token")}",
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
  static Future<dio.Response> getResources() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = AppConstants.BASE_URL + AppConstants.GET_RESOURCES;
    dio.Response response;
    response = await ApiMethods.getMethod(headers: {
      "Authorization": "Bearer ${sharedPreferences.getString("token")}",
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
