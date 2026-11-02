import 'package:flutter/cupertino.dart';
import 'package:fluttercoba/menu/history_page.dart';
import 'package:fluttercoba/menu/home_page.dart';
import 'package:fluttercoba/menu/profile_page.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{
  final RxInt selectedIndex = 0.obs;

  void changePage(int index){
    selectedIndex.value = index;
  }

  List<Widget> listPages = [HomePage(), HistoryPage(), ProfilePage()];

}