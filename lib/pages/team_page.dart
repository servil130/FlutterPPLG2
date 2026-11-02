import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/team_controller.dart';
import 'package:get/get.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});

  final controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Premier League (TheSportsDB)")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.errorMsg.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMsg.value, textAlign: TextAlign.center),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: controller.fetchTeams,
                  child: const Text("Coba lagi"),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final team = controller.teams[index];
            return ListTile(
              leading: SizedBox(
                width: 48,
                height: 48,
                child: team.badge.isEmpty
                    ? const Icon(Icons.sports_soccer)
                    : Image.network(
                  team.badge,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.sports_soccer),
                ),
              ),
              title: Text(
                team.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${team.stadion} • ${team.negara}"),
              onTap: () => Get.defaultDialog(
                title: team.nama,
                content: SizedBox(
                  height: 220,
                  child: SingleChildScrollView(child: Text(team.deskripsi)),
                ),
                textConfirm: "Tutup",
                onConfirm: () => Get.back(),
              ),
            );
          },
        );
      }),
    );
  }
}