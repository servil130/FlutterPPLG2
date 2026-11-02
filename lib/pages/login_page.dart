import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/login_controller.dart';
import 'package:fluttercoba/src/CustomButton.dart';
import 'package:fluttercoba/src/CustomTextField.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login API")),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextfield(
                  myHint: "input username",
                  txtController: controller.txtUsername,
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  myHint: "input password",
                  txtController: controller.txtPassword,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                Obx(
                      () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                    myLabel: "Login",
                    onTap: () => controller.login(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}