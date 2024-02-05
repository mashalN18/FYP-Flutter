// To parse this JSON data, do
//
//     final getLeavesSuccessResponse = getLeavesSuccessResponseFromJson(jsonString);

import 'dart:convert';

GetLeavesSuccessResponse getLeavesSuccessResponseFromJson(String str) => GetLeavesSuccessResponse.fromJson(json.decode(str));

String getLeavesSuccessResponseToJson(GetLeavesSuccessResponse data) => json.encode(data.toJson());

class GetLeavesSuccessResponse {
  bool success;
  List<Datum> data;

  GetLeavesSuccessResponse({
    required this.success,
    required this.data,
  });

  factory GetLeavesSuccessResponse.fromJson(Map<String, dynamic> json) => GetLeavesSuccessResponse(
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
  DateTime applyDate;
  String reason;
  String status;
  String type;
  String description;
  DateTime startDate;
  DateTime endDate;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.userId,
    required this.applyDate,
    required this.reason,
    required this.status,
    required this.type,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    userId: json["userId"],
    applyDate: DateTime.parse(json["applyDate"]),
    reason: json["reason"],
    status: json["status"],
    type: json["type"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "applyDate": applyDate.toIso8601String(),
    "reason": reason,
    "status": status,
    "type": type,
    "description": description,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
