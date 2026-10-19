import 'package:flutter/material.dart';
import 'package:fluttercoba/model/makanan_model.dart';
import 'package:get/get.dart';

class DetailMakananController extends GetxController {
  late MakananModel makanan;

  // warna dan gaya teks (supaya page tidak perlu mendeklarasikan variabel)
  ColorScheme scheme(BuildContext context) => Theme.of(context).colorScheme;

  TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

  TextStyle? appBarTitleStyle(BuildContext context) =>
      textTheme(context).titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: scheme(context).onPrimary,
      );

  TextStyle? labelStyle(BuildContext context) =>
      textTheme(context).labelMedium?.copyWith(
        color: scheme(context).primary,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
      );

  TextStyle? bodyStyle(BuildContext context) =>
      textTheme(context).bodyLarge?.copyWith(height: 1.5);

  @override
  void onInit() {
    super.onInit();
    makanan = Get.arguments;
  }
}