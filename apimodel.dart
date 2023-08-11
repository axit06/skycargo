// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String status;
  Logindata logindata;
  String responseCode;

  User({
    required this.status,
    required this.logindata,
    required this.responseCode,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"],
    logindata: Logindata.fromJson(json["logindata"]),
    responseCode: json["ResponseCode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "logindata": logindata.toJson(),
    "ResponseCode": responseCode,
  };
}

class Logindata {
  int id;
  String firstName;
  String lastName;
  String email;
  String countryCode;
  String phoneNo;
  String password;
  String role;

  Logindata({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.countryCode,
    required this.phoneNo,
    required this.password,
    required this.role,
  });

  factory Logindata.fromJson(Map<String, dynamic> json) => Logindata(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    countryCode: json["country_code"],
    phoneNo: json["phone_no"],
    password: json["password"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "country_code": countryCode,
    "phone_no": phoneNo,
    "password": password,
    "role": role,
  };
}
