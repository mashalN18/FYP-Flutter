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
  TaskStatus taskStatus;
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
    type: typeValues.map[json["type"]]!,
    taskStatus: taskStatusValues.map[json["task_status"]]!,
    id: json["id"],
    taskImage: json["task_image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "type": typeValues.reverse[type],
    "task_status": taskStatusValues.reverse[taskStatus],
    "id": id,
    "task_image": taskImage,
  };
}

enum TaskStatus {
  COMPLETED,
  OPEN,
  SUBMITED
}

final taskStatusValues = EnumValues({
  "Completed": TaskStatus.COMPLETED,
  "Open": TaskStatus.OPEN,
  "Submited": TaskStatus.SUBMITED
});

enum Type {
  NEW,
  RECURSIVE,
  TYPE_NEW
}

final typeValues = EnumValues({
  "new": Type.NEW,
  "Recursive": Type.RECURSIVE,
  "New": Type.TYPE_NEW
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
