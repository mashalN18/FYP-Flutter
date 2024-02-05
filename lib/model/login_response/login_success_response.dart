// To parse this JSON data, do
//
//     final loginSuccessResponse = loginSuccessResponseFromJson(jsonString);

import 'dart:convert';

LoginSuccessResponse loginSuccessResponseFromJson(String str) => LoginSuccessResponse.fromJson(json.decode(str));

String loginSuccessResponseToJson(LoginSuccessResponse data) => json.encode(data.toJson());

class LoginSuccessResponse {
  bool success;
  String message;
  Data data;

  LoginSuccessResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) => LoginSuccessResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  bool isVerified;
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String token;

  Data({
    required this.isVerified,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isVerified: json["isVerified"],
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    image: json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "isVerified": isVerified,
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "token": token,
  };
}
