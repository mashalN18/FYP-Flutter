// To parse this JSON data, do
//
//     final taskErrorResponse = taskErrorResponseFromJson(jsonString);

import 'dart:convert';

TaskErrorResponse taskErrorResponseFromJson(String str) => TaskErrorResponse.fromJson(json.decode(str));

String taskErrorResponseToJson(TaskErrorResponse data) => json.encode(data.toJson());

class TaskErrorResponse {
  String message;

  TaskErrorResponse({
    required this.message,
  });

  factory TaskErrorResponse.fromJson(Map<String, dynamic> json) => TaskErrorResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
