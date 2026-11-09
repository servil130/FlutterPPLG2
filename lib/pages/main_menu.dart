import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/main_menu_controller.dart';
import 'package:get/get.dart';

class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  final controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.listPages,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Color(0xFFDBDBDB), width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changePage,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF262626),
            unselectedItemColor: const Color(0xFF8E8E8E),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 28),
                activeIcon: Icon(Icons.home, size: 28),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined, size: 28),
                activeIcon: Icon(Icons.history, size: 28),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 28),
                activeIcon: Icon(Icons.person, size: 28),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
