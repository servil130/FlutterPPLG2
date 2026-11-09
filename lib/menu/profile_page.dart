import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/login_controller.dart';
import 'package:fluttercoba/routes.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.isRegistered<LoginController>()
        ? Get.find<LoginController>()
        : null;
    final username = loginController?.txtUsername.text.isNotEmpty == true
        ? loginController!.txtUsername.text
        : "Dzakz";

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFF00AA5B),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "dzakiymang@gmail.com",
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00AA5B).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "Member Silver",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF00AA5B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon:
                        const Icon(Icons.edit_outlined, color: Colors.black54),
                    onPressed: () {},
                  )
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildListTile(
                      icon: Icons.history, title: "Riwayat Transaksi"),
                  const Divider(height: 1, indent: 50),
                  _buildListTile(
                      icon: Icons.location_on_outlined,
                      title: "Alamat Pengiriman"),
                  const Divider(height: 1, indent: 50),
                  _buildListTile(
                      icon: Icons.settings_outlined,
                      title: "Pengaturan Akun"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              color: Colors.white,
              child: _buildListTile(
                icon: Icons.logout,
                title: "Keluar",
                isDestructive: true,
                onTap: () {
                  Get.offAllNamed(Routes.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    final color = isDestructive ? Colors.red : Colors.black87;

    return ListTile(
      leading: Icon(icon,
          color: isDestructive ? Colors.red : const Color(0xFF00AA5B)),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded,
          size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
