import 'package:flutter/material.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("ini home"),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Get.toNamed(Routes.team_list),
              child: const Text("Daftar Tim (API TheSportsDB)"),
            ),
          ],
        ),
      ),
    );
  }
}