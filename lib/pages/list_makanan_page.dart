import 'package:flutter/material.dart';
import 'package:fluttercoba/controller/list_makanan_controller.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  // menyambungkan page dan controller
  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.scheme(context).surfaceContainer,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: controller.scheme(context).primary,
        foregroundColor: controller.scheme(context).onPrimary,
        title: Text(
          "Menu Makanan",
          style: controller.appBarTitleStyle(context),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
              () => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: controller.dataMakanan.length,
            itemBuilder: (context, index) => Dismissible(
              key: ValueKey(controller.dataMakanan[index].namaMakanan),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) => controller.hapus(index),
              background: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: InkWell(
                onTap: () => controller.bukaDetail(index),
                child: ListTile(
                  tileColor: controller.scheme(context).surfaceContainerLowest,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: BorderSide(
                      color: controller.scheme(context).surfaceContainer,
                      width: 5,
                    ),
                  ),
                  title: Text(
                    controller.dataMakanan[index].namaMakanan,
                    style: controller.textTheme(context).titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Rp ${controller.dataMakanan[index].harga}",
                    style: controller.textTheme(context).bodyLarge?.copyWith(
                      color: controller.scheme(context).primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_rounded,
                    color: controller.scheme(context).primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}