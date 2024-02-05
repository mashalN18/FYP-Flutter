import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:login_page/model/task_response/task_error_response.dart';
import 'package:login_page/services/api_client.dart';
import 'package:login_page/utils/general_helper.dart';
import 'package:login_page/utils/logs.dart';
import 'package:login_page/utils/status_codes.dart';

import '../model/task_response/task_success_response.dart';


class TaskScreenController extends GetxController{

  bool isLoading = false;
  int currentPage = 1;
  int totalPage = 0;
  List<Datum> taskList = [];

  Future<bool> getTasks() async {
    isLoading = true;
    update();
    dio.Response response = await ApiClient.getTasks();
    isLoading = false;
    update();
    if (response.statusCode == HttpStatusCodes.OK) {
      String responseJson = json.encode(response.data);
    final taskSuccessResponse = taskSuccessResponseFromJson(responseJson);
      taskList = taskSuccessResponse.data;
      update();
      return true;
    } else if (response.statusCode! >= HttpStatusCodes.BAD_REQUEST) {
      String responseJson = json.encode(response.data);

    final taskErrorResponse = taskErrorResponseFromJson(responseJson);
      GeneralHelper.snackBar(
          title: "Error",
          message: taskErrorResponse.message,
          isError: true);
      return false;
    } else if (response.statusCode! == HttpStatusCodes.UNAUTHORIZED) {
      String responseJson = json.encode(response.data);

      final taskErrorResponse = taskErrorResponseFromJson(responseJson);
      GeneralHelper.snackBar(
          title: "Error",
          message: taskErrorResponse.message,
          isError: true);
      return false;
    } else if (response.statusCode! == HttpStatusCodes.INTERNAL_SERVER_ERROR) {
      String responseJson = json.encode(response.data);

      final taskErrorResponse = taskErrorResponseFromJson(responseJson);
      GeneralHelper.snackBar(
          title: "Error",
          message: taskErrorResponse.message,
          isError: true);
      return false;
    }
    return false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getTasks();
    super.onInit();

  }


}