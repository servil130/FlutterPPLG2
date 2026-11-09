// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final bool status;
  final String message;
  final String token;

  LoginModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] == true || json["status"] == "true",
        message: (json["message"] ?? "").toString(),
        token: (json["token"] ?? "").toString(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
      };
}

// Alias dan fungsi kompatibilitas jika dipanggil dengan nama Welcome / welcomeFromJson
typedef Welcome = LoginModel;
Welcome welcomeFromJson(String str) => loginModelFromJson(str);
String welcomeToJson(Welcome data) => loginModelToJson(data);
