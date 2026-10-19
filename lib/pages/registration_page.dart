import 'package:fluttercoba/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final usernameController = TextEditingController();
  final namaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Buat Akun",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    Get.toNamed(
                      Routes.confirmRegistration,
                      arguments: {
                        "username": usernameController.text,
                        "nama_lengkap": namaController.text,
                      },
                    );
                  },
                  child: const Text("Daftar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}