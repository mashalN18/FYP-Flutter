import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:login_page/utils/general_helper.dart';
import 'package:login_page/utils/logs.dart';
import 'package:login_page/utils/status_codes.dart';


class TaskScreenController extends GetxController{

  bool isLoading = false;
  int currentPage = 1;
  int totalPage = 0;

  // Future<bool> getTasks() async {
  //   isLoading = true;
  //   update();
  //   dio.Response response =
  //   // await ApiClient.getNotifications(page: currentPage, limit: totalPage);
  //
  //   isLoading = false;
  //   update();
  //   if (response.statusCode == HttpStatusCodes.OK) {
  //     String responseJson = json.encode(response.data);
  //     // GeneralHelper.snackBar(
  //     //     title: "Congratulations", message: "Login Successfully");
  //
  //     update();
  //
  //     return true;
  //   } else if (response.statusCode! >= HttpStatusCodes.BAD_REQUEST) {
  //     String responseJson = json.encode(response.data);
  //
  //     final notificationListErrorResponse =
  //     notificationListErrorResponseFromJson(responseJson);
  //     GeneralHelper.snackBar(
  //         title: "Error",
  //         message: notificationListErrorResponse.message,
  //         isError: true);
  //     return false;
  //   } else if (response.statusCode! == HttpStatusCodes.UNAUTHORIZED) {
  //     String responseJson = json.encode(response.data);
  //
  //     final notificationListErrorResponse =
  //     notificationListErrorResponseFromJson(responseJson);
  //     GeneralHelper.snackBar(
  //         title: "Error",
  //         message: notificationListErrorResponse.message,
  //         isError: true);
  //     return false;
  //   } else if (response.statusCode! == HttpStatusCodes.INTERNAL_SERVER_ERROR) {
  //     String responseJson = json.encode(response.data);
  //
  //     // final notificationListErrorResponse =
  //     // notificationListErrorResponseFromJson(responseJson);
  //     // GeneralHelper.snackBar(
  //     //     title: "Error",
  //     //     message: notificationListErrorResponse.message,
  //     //     isError: true);
  //     return false;
  //   }
  //   return false;
  // }


}