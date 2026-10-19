import 'package:fluttercoba/pages/confirm_registration.dart';
import 'package:fluttercoba/pages/detail_makanan_page.dart';
import 'package:fluttercoba/pages/list_makanan_page.dart';
import 'package:fluttercoba/pages/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String list_makanan = "/list_makanan";
  static const String detail_makanan = "/detail_makanan";
  //dll

  static final myPages = [
    GetPage(name: registration, page: ()=> RegistrationPage()),
    GetPage(name: confirm_registration, page: ()=> ConfirmRegistration()),
    GetPage(name: list_makanan, page: ()=> ListMakananPage()),
    GetPage(name: detail_makanan, page: ()=> DetailMakananPage()),
  ];
}