// To parse this JSON data, do
//
//     final leaveSuccessResponse = leaveSuccessResponseFromJson(jsonString);

import 'dart:convert';

List<LeaveSuccessResponse> leaveSuccessResponseFromJson(String str) => List<LeaveSuccessResponse>.from(json.decode(str).map((x) => LeaveSuccessResponse.fromJson(x)));

String leaveSuccessResponseToJson(List<LeaveSuccessResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaveSuccessResponse {
  String? title;
  int id;
  String reason;
  DateTime applyDate;
  DateTime startDate;
  DateTime endDate;
  String type;
  String description;
  String status;
  String name;

  LeaveSuccessResponse({
    required this.title,
    required this.id,
    required this.reason,
    required this.applyDate,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.description,
    required this.status,
    required this.name,
  });

  factory LeaveSuccessResponse.fromJson(Map<String, dynamic> json) => LeaveSuccessResponse(
    title: json["title"],
    id: json["id"],
    reason: json["reason"],
    applyDate: DateTime.parse(json["apply_date"]),
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    type: json["type"],
    description: json["description"],
    status: json["status"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "reason": reason,
    "apply_date": "${applyDate.year.toString().padLeft(4, '0')}-${applyDate.month.toString().padLeft(2, '0')}-${applyDate.day.toString().padLeft(2, '0')}",
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "type": type,
    "description": description,
    "status": status,
    "name": name,
  };
}
