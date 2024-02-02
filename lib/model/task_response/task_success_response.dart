// To parse this JSON data, do
//
//     final taskSuccessResponse = taskSuccessResponseFromJson(jsonString);

import 'dart:convert';

List<TaskSuccessResponse> taskSuccessResponseFromJson(String str) => List<TaskSuccessResponse>.from(json.decode(str).map((x) => TaskSuccessResponse.fromJson(x)));

String taskSuccessResponseToJson(List<TaskSuccessResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskSuccessResponse {
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  Type? type;
  String taskStatus;
  int id;
  String? taskImage;

  TaskSuccessResponse({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.taskStatus,
    required this.id,
    required this.taskImage,
  });

  factory TaskSuccessResponse.fromJson(Map<String, dynamic> json) => TaskSuccessResponse(
    name: json["name"],
    description: json["description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    type: json["type"],
    taskStatus: json["task_status"],
    id: json["id"],
    taskImage: json["task_image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "type": type,
    "task_status": taskStatus,
    "id": id,
    "task_image": taskImage,
  };
}

