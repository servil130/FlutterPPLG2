import 'package:flutter/material.dart';
import 'package:fluttercoba/calculator.dart';
import 'package:fluttercoba/login_page.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: Colors.deepOrange);

    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        appBarTheme: AppBarTheme(
          backgroundColor: scheme.surface,
          scrolledUnderElevation: 0,
        ),
      ),
      initialRoute: Routes.list_makanan,
      getPages: Routes.myPages,
    );
  }
}