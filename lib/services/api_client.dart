import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/Dashboard/MainScreen/dashboard.dart';
import 'package:login_page/services/api_method.dart';
import 'package:login_page/utils/app_constants.dart';
import 'package:login_page/utils/logs.dart';
import 'package:http/http.dart' as http;

class ApiClient {
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

  static const baseUrl = "http://127.0.0.1:8000/api/";

  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final url = await Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
      // final url = await Uri.parse("http://127.0.0.1:8000/api/leave");
      print("-------------------------------------parsed--------------------");
      var response = await http.post(url, headers: {
        'Authorization': 'Bearer 1|68CBxqGnar60LnDD8kOwTDxOyROZawPDouHQkZy0',
        'Accept': 'application/json',
      }, body: {
        "email": email,
        "password": password
      });
      print(
          "-----------------------------------------response.body-----------------");
      print("response.statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        print("response is 200");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } else {
        throw Exception('Failed to load leaves');
      }
    } catch (error) {
      print(error);
      throw Exception('Error fetching leaves: $error');
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
  // static Future<dio.Response> getTasks() async {
  //   var url = AppConstants.BASE_URL + AppConstants.GET_TASKS;
  //   dio.Response response;
  //   response = await ApiMethods.getMethod(headers: {
  //     // "Authorization": "Bearer ${Preferences.getAuthId()}",
  //     "Content-Type": "application/json",
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
}
