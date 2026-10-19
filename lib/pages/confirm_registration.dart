import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistration extends StatelessWidget {
  const ConfirmRegistration({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Page")),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Nama: ${args['nama_lengkap'] ?? '-'}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Email: ${args['email'] ?? '-'}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("Gender: ${args['jenis_kelamin'] ?? '-'}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Text("No WA: ${args['no_wa'] ?? '-'}",
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}