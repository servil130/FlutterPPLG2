import 'package:fluttercoba/controller/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistration extends StatelessWidget {
  ConfirmRegistration({super.key});

  final controller = Get.put(ConfirmRegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konfirmasi"), centerTitle: true),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Data Pendaftaran",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Username"),
                    subtitle: Text(controller.username),
                  ),
                  ListTile(
                    leading: const Icon(Icons.badge),
                    title: const Text("Nama Lengkap"),
                    subtitle: Text(controller.namaLengkap),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () => Get.back(),
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}