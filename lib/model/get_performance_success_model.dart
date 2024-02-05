// To parse this JSON data, do
//
//     final resourcesSuccessResponse = resourcesSuccessResponseFromJson(jsonString);

import 'dart:convert';

ResourcesSuccessResponse resourcesSuccessResponseFromJson(String str) => ResourcesSuccessResponse.fromJson(json.decode(str));

String resourcesSuccessResponseToJson(ResourcesSuccessResponse data) => json.encode(data.toJson());

class ResourcesSuccessResponse {
  bool success;
  List<Datum> data;

  ResourcesSuccessResponse({
    required this.success,
    required this.data,
  });

  factory ResourcesSuccessResponse.fromJson(Map<String, dynamic> json) => ResourcesSuccessResponse(
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
  String type;
  DateTime applyDate;
  int empId;
  String item;
  String building;
  String floor;
  String room;
  String description;
  String approval;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  Datum({
    required this.id,
    required this.type,
    required this.applyDate,
    required this.empId,
    required this.item,
    required this.building,
    required this.floor,
    required this.room,
    required this.description,
    required this.approval,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    type: json["type"],
    applyDate: DateTime.parse(json["applyDate"]),
    empId: json["empId"],
    item: json["item"],
    building: json["building"],
    floor: json["floor"],
    room: json["room"],
    description: json["description"],
    approval: json["approval"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "type": type,
    "applyDate": applyDate.toIso8601String(),
    "empId": empId,
    "item": item,
    "building": building,
    "floor": floor,
    "room": room,
    "description": description,
    "approval": approval,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
