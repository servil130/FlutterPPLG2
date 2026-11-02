import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");
      final response = await http.post(url, body: {
        "username": txtUsername.text,
        "password": txtPassword.text,
      });
      isLoading.value = false;

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          Get.snackbar("berhasil", data['message'].toString());
          Get.offNamed(Routes.main_menu);
        } else {
          Get.snackbar("gagal", data['message'].toString());
        }
      } else {
        Get.snackbar("gagal", "cek internet connection");
      }
    } catch (e) {
      isLoading.value = false;
      print("errornya $e");
      Get.snackbar("gagal", e.toString());
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}