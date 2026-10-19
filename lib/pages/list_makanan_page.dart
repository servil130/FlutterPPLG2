import 'package:fluttercoba/controller/list_makanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttercoba/routes.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: scheme.surfaceContainer,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        title: Text(
          "Menu Makanan",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: scheme.onPrimary,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: controller.dataMakanan.length,
          itemBuilder: (context, index) {
            final makanan = controller.dataMakanan[index];
            return ListTile(
              onTap: () {
                Get.toNamed(Routes.detail_makanan, arguments: makanan);
              },
              tileColor: scheme.surfaceContainerLowest,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: BorderSide(color: scheme.surfaceContainer, width: 5),
              ),
              title: Text(
                makanan.namaMakanan,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Rp ${makanan.harga}",
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                color: scheme.primary,
              ),
            );
          },
        ),
      ),
    );
  }
}