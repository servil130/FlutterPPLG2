// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final bool status;
  final String message;
  final String token;

  Welcome({
    required this.status,
    required this.message,
    required this.token,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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


typedef LoginModel = Welcome;
LoginModel loginModelFromJson(String str) => welcomeFromJson(str);
String loginModelToJson(LoginModel data) => welcomeToJson(data);
