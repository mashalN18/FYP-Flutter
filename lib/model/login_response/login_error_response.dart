// To parse this JSON data, do
//
//     final loginErrorResponse = loginErrorResponseFromJson(jsonString);

import 'dart:convert';

LoginErrorResponse loginErrorResponseFromJson(String str) => LoginErrorResponse.fromJson(json.decode(str));

String loginErrorResponseToJson(LoginErrorResponse data) => json.encode(data.toJson());

class LoginErrorResponse {
  String message;

  LoginErrorResponse({
    required this.message,
  });

  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) => LoginErrorResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
