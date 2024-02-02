// To parse this JSON data, do
//
//     final loginSuccessResponse = loginSuccessResponseFromJson(jsonString);

import 'dart:convert';

LoginSuccessResponse loginSuccessResponseFromJson(String str) => LoginSuccessResponse.fromJson(json.decode(str));

String loginSuccessResponseToJson(LoginSuccessResponse data) => json.encode(data.toJson());

class LoginSuccessResponse {
  User user;
  String token;

  LoginSuccessResponse({
    required this.user,
    required this.token,
  });

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) => LoginSuccessResponse(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  int id;
  String name;
  String firstName;
  String lastName;
  String employeeCode;
  String phone;
  String address;
  String email;
  String dob;
  String gender;
  DateTime createdAt;
  dynamic updatedAt;
  int status;
  String role;
  int deptId;
  String siteUrl;
  String cnic;
  String image;

  User({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.employeeCode,
    required this.phone,
    required this.address,
    required this.email,
    required this.dob,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.role,
    required this.deptId,
    required this.siteUrl,
    required this.cnic,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    employeeCode: json["employee_code"],
    phone: json["phone"],
    address: json["address"],
    email: json["email"],
    dob: json["dob"],
    gender: json["gender"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    status: json["status"],
    role: json["role"],
    deptId: json["dept_id"],
    siteUrl: json["site_url"],
    cnic: json["cnic"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "employee_code": employeeCode,
    "phone": phone,
    "address": address,
    "email": email,
    "dob": dob,
    "gender": gender,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "status": status,
    "role": role,
    "dept_id": deptId,
    "site_url": siteUrl,
    "cnic": cnic,
    "image": image,
  };
}
