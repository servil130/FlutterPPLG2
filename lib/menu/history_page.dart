import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/team_controller.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "History API",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF00AA5B)),
            onPressed: () => controller.fetchTeams(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFF00AA5B)),
          );
        }

        if (controller.errorMsg.value.isNotEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(
                    controller.errorMsg.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: controller.fetchTeams,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00AA5B),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            ),
          );
        }

        return RefreshIndicator(
          color: const Color(0xFF00AA5B),
          onRefresh: () => controller.fetchTeams(),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: controller.teams.length,
            separatorBuilder: (_, __) => const Divider(
              color: Color(0xFFEEEEEE),
              height: 1,
            ),
            itemBuilder: (context, index) {
              final team = controller.teams[index];
              return Container(
                color: Colors.white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  leading: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                    ),
                    child: team.badge.isEmpty
                        ? const Icon(Icons.sports_soccer, color: Colors.grey)
                        : Image.network(
                            team.badge,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Icon(
                                Icons.sports_soccer,
                                color: Colors.grey),
                          ),
                  ),
                  title: Text(
                    team.nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            "${team.stadion} • ${team.negara}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Colors.grey,
                  ),
                  onTap: () => Get.defaultDialog(
                    title: team.nama,
                    titleStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    content: SizedBox(
                      height: 240,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (team.badge.isNotEmpty)
                              Image.network(
                                team.badge,
                                height: 80,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => const SizedBox(),
                              ),
                            const SizedBox(height: 10),
                            Text(
                              "Stadion: ${team.stadion}\nNegara: ${team.negara}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              team.deskripsi,
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    textConfirm: "Tutup",
                    confirmTextColor: Colors.white,
                    buttonColor: const Color(0xFF00AA5B),
                    onConfirm: () => Get.back(),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
