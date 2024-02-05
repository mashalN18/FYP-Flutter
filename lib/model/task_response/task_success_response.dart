// To parse this JSON data, do
//
//     final taskSuccessResponse = taskSuccessResponseFromJson(jsonString);

import 'dart:convert';

TaskSuccessResponse taskSuccessResponseFromJson(String str) => TaskSuccessResponse.fromJson(json.decode(str));

String taskSuccessResponseToJson(TaskSuccessResponse data) => json.encode(data.toJson());

class TaskSuccessResponse {
  bool success;
  List<Datum> data;

  TaskSuccessResponse({
    required this.success,
    required this.data,
  });

  factory TaskSuccessResponse.fromJson(Map<String, dynamic> json) => TaskSuccessResponse(
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
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  String type;
  String taskStatus;
  int assignToId;
  String taskImage;
  int createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.taskStatus,
    required this.assignToId,
    required this.taskImage,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    type: json["type"],
    taskStatus: json["taskStatus"],
    assignToId: json["assignToId"],
    taskImage: json["taskImage"],
    createdBy: json["CreatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "type": type,
    "taskStatus": taskStatus,
    "assignToId": assignToId,
    "taskImage": taskImage,
    "CreatedBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
