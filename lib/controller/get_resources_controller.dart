import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:login_page/model/task_response/task_error_response.dart';
import 'package:login_page/services/api_client.dart';
import 'package:login_page/utils/general_helper.dart';
import 'package:login_page/utils/status_codes.dart';

import '../model/resources_success_model.dart';

class GetResourceController extends GetxController{
  bool isLoading = false;
  List<Datum> getResourcesList = [];

  Future<bool> getResources() async {
    isLoading = true;
    update();
    dio.Response response =
    await ApiClient.getResources();

    isLoading = false;
    update();
    if (response.statusCode == HttpStatusCodes.OK) {
      String responseJson = json.encode(response.data);
    final resourcesSuccessResponse = resourcesSuccessResponseFromJson(responseJson);
      getResourcesList = resourcesSuccessResponse.data;
      update();

      return true;
    } else if (response.statusCode! >= HttpStatusCodes.BAD_REQUEST) {
      String responseJson = json.encode(response.data);

      // final taskErrorResponse = taskErrorResponseFromJson(responseJson);
      GeneralHelper.snackBar(
          title: "Error",
          message: "Oppps",
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
    getResources();
    super.onInit();
  }




}