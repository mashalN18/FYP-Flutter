// To parse this JSON data, do
//
//     final getPerformanceSuccessResponse = getPerformanceSuccessResponseFromJson(jsonString);

import 'dart:convert';

GetPerformanceSuccessResponse getPerformanceSuccessResponseFromJson(String str) => GetPerformanceSuccessResponse.fromJson(json.decode(str));

String getPerformanceSuccessResponseToJson(GetPerformanceSuccessResponse data) => json.encode(data.toJson());

class GetPerformanceSuccessResponse {
  bool success;
  List<Datum> data;

  GetPerformanceSuccessResponse({
    required this.success,
    required this.data,
  });

  factory GetPerformanceSuccessResponse.fromJson(Map<String, dynamic> json) => GetPerformanceSuccessResponse(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String userId;
  String taskId;
  String taskStatus;
  String comments;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.userId,
    required this.taskId,
    required this.taskStatus,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    userId: json["userId"],
    taskId: json["taskId"],
    taskStatus: json["taskStatus"],
    comments: json["comments"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "taskId": taskId,
    "taskStatus": taskStatus,
    "comments": comments,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
