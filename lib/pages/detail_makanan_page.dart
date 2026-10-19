import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/detail_makanan_controller.dart';
import 'package:get/get.dart';

class DetailMakananPage extends StatelessWidget {
  const DetailMakananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMakananController());
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    final label = theme.textTheme.labelMedium?.copyWith(
      color: scheme.primary,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    );
    final body = theme.textTheme.bodyLarge?.copyWith(height: 1.5);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        title: Text(
          "Detail Makanan",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: scheme.onPrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                controller.makanan.gambarPath,
                height: 240,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 240,
                  width: double.infinity,
                  color: scheme.primaryContainer,
                  child: Icon(
                    Icons.restaurant_rounded,
                    size: 56,
                    color: scheme.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              controller.makanan.namaMakanan,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rp ${controller.makanan.harga}",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: scheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "★ ${controller.makanan.rating.runes.length}/5",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),
            Text("REVIEW", textAlign: TextAlign.center, style: label),
            const SizedBox(height: 6),
            Text(
              controller.makanan.review,
              textAlign: TextAlign.center,
              style: body,
            ),
            const SizedBox(height: 24),
            Text("DESKRIPSI", textAlign: TextAlign.center, style: label),
            const SizedBox(height: 6),
            Text(
              controller.makanan.deskripsi,
              textAlign: TextAlign.center,
              style: body,
            ),
          ],
        ),
      ),
    );
  }
}