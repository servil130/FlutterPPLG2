import 'package:fluttercoba/menu/history_page.dart';
import 'package:fluttercoba/menu/home_page.dart';
import 'package:fluttercoba/menu/profile_page.dart';
import 'package:fluttercoba/pages/confirm_registration.dart';
import 'package:fluttercoba/pages/detail_makanan_page.dart';
import 'package:fluttercoba/pages/list_makanan_page.dart';
import 'package:fluttercoba/pages/login_page.dart';
import 'package:fluttercoba/pages/main_menu.dart';
import 'package:fluttercoba/pages/registration_page.dart';
import 'package:fluttercoba/pages/team_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirm_registration = "/confirm_registration";
  static const String list_makanan = "/list_makanan";
  static const String detail_makanan = "/detail_makanan";
  static const String home_page = "/home_page";
  static const String history_page = "/history_page";
  static const String profile_page = "/profile_page";
  static const String main_menu = "/main_menu";
  static const String login = "/login";
  static const String team_list = "/team_list";

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirm_registration, page: () => ConfirmRegistration()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    GetPage(name: home_page, page: () => HomePage()),
    GetPage(name: history_page, page: () => HistoryPage()),
    GetPage(name: profile_page, page: () => ProfilePage()),
    GetPage(name: main_menu, page: () => MainMenu()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: team_list, page: () => TeamPage()),
  ];
}