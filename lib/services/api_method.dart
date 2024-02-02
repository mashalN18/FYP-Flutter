import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_page/utils/logs.dart';

class ApiMethods {
  static dio.Dio dioObj = dio.Dio();

  static Future<dio.Response> postRequest(Map<String, dynamic> headers,
      {required Map<String, dynamic> data, required url}) async {
    try {
      // dio.FormData formData = dio.FormData.fromMap(data);
      dio.Response response = await dioObj.post(url,
          data: data,
          onSendProgress: (int sent, int total) {},
          options: dio.Options(
            followRedirects: true,
            sendTimeout: const Duration(milliseconds: 100000),
            receiveTimeout: const Duration(milliseconds: 100000),
            validateStatus: (status) => true,
            headers: headers,
          ));
      logs(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else if (response.statusCode! == 401) {
        return response;
      } else if (response.statusCode! == 402) {
        return response;
      } else if (response.statusCode! == 422) {
        return response;
      } else if (response.statusCode! == 302) {
        return response;
      } else if (response.statusCode! == 500) {
        return response;
      } else {
        return response;
      }
    } on dio.DioError catch (e) {
      print("e ${e.message}");
      if (e.message == "Receiving data timeout[50000ms]") {
        throw Exception("Receiving data timeout[50000ms]");
      }
      if (e.message == "Http status error [401]") {
        throw Exception("Http status error [401]");
      } else if (e.message == "Http status error [500]") {
        throw Exception("Http status error [500]");
      } else if (e.message == "Sending timeout[100000ms]") {
        throw Exception("Sending timeout[100000ms]");
      }
      print(e.message);
      throw Exception(e.message);
    }
  }

  static Future<dio.Response> updateDataRequest(Map<String, dynamic> headers,
      {required Map<String, dynamic> data, required url}) async {
    try {
      dio.Response response = await dioObj.put(url,
          data: data,
          onSendProgress: (int sent, int total) {},
          options: dio.Options(
            followRedirects: true,
            sendTimeout: Duration(milliseconds: 100000),
            receiveTimeout: Duration(milliseconds: 100000),
            validateStatus: (status) => true,
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode! == 401) {
        return response;
      } else if (response.statusCode! == 302) {
        return response;
      } else if (response.statusCode! == 500) {
        return response;
      } else {
        return response;
      }
    } on dio.DioError catch (e) {
      print("e ${e.message}");
      if (e.message == "Receiving data timeout[50000ms]") {
        throw Exception("Receiving data timeout[50000ms]");
      }
      if (e.message == "Http status error [401]") {
        throw Exception("Http status error [401]");
      } else if (e.message == "Http status error [500]") {
        throw Exception("Http status error [500]");
      }
      throw Exception(e.message);
    }
  }

  static Future<String> postRequestResponse(
      {required Map<String, dynamic> data, required url}) async {
    dio.Response response = await ApiMethods.postRequest(
        {"Accept": "application/json"},
        data: data, url: url);
    try {
      if (response.statusCode == 200) {
        return "200";
      } else if (response.statusCode == 401) {
        return "401";
      } else if (response.statusCode == 302) {
        return "302";
      } else if (response.statusCode == 500) {
        return "500";
      } else {
        return "Failed";
      }
    } on dio.DioError catch (e) {
      if (e.message == "Receiving data timeout[50000ms]") {
        return "Connection error";
      }
      if (e.message == "Http status error [401]") {
        return "401";
      }
      return "Failed";
    }
  }

  static Future<dio.Response> getMethod(
      {required Map<String, dynamic> headers, required String url}) async {
    Response response = await dioObj.get(
      url,
      options: Options(
          responseType: ResponseType.json,
          headers: headers,
          receiveTimeout: const Duration(milliseconds: 100000),
          sendTimeout: const Duration(milliseconds: 100000),
          validateStatus: (status) {
            return status! < 500;
          },
          receiveDataWhenStatusError: false),
    );

    if (response.statusCode! >= 400) {}

    return response;
  }

  static Future<dio.Response> patchMethod(BuildContext context,
      {required Map<String, dynamic> headers, required String url}) async {
    Response response = await dioObj.patchUri(
      Uri.parse(url),
      options: Options(
          responseType: ResponseType.json,
          headers: headers,
          receiveTimeout: Duration(milliseconds: 100000),
          sendTimeout: Duration(milliseconds: 100000),
          validateStatus: (status) {
            return status! < 500;
          },
          receiveDataWhenStatusError: false),
    );

    if (response.statusCode! >= 400) {}

    return response;
  }

  static Future<dio.Response> deleteMethod(
      {required Map<String, dynamic> headers, required String url}) async {
    Response response = await dioObj.deleteUri(
      Uri.parse(url),
      options: Options(
          responseType: ResponseType.json,
          headers: headers,
          receiveTimeout: Duration(milliseconds: 100000),
          validateStatus: (status) {
            return status! < 500;
          },
          sendTimeout: Duration(milliseconds: 100000),
          receiveDataWhenStatusError: false),
    );
    if (response.statusCode == 404) {
      return response;
    }

    return response;
  }
}

