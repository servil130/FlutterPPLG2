import 'package:flutter/material.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      ),
      initialRoute: Routes.list_makanan,
      getPages: Routes.myPages,
    );
  }
}