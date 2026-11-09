import 'package:flutter/material.dart';
import 'package:fluttercoba/model/login_model.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var isLoading = false.obs;

  // 1. Deklarasi Rxn<LoginModel>
  var loginModel = Rxn<LoginModel>();

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

      // 2. Di dalam if status code 200
      if (response.statusCode == 200) {
        loginModel.value = loginModelFromJson(response.body);

        // 3. Menggunakan loginModel.value?.status
        if (loginModel.value?.status == true) {
          Get.snackbar("berhasil", loginModel.value?.message ?? "");
          Get.offNamed(Routes.main_menu);
        } else {
          Get.snackbar("gagal", loginModel.value?.message ?? "");
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