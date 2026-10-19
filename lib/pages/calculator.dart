import 'package:fluttercoba/src/CustomTextField.dart';
import 'package:fluttercoba/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  // menyambungkan page dan controller
  final controller = Get.put(KalkulatorController());


  final txtangka1 = TextEditingController();
  final txtangka2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F0FF),
      appBar: AppBar(
        title: const Text(
          'My Kalkulator',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(

            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.calculate,
                        size: 64, color: Colors.amber),
                    const SizedBox(height: 8),
                    const Text(
                      'Penjumlahan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 24),

                    CustomTextfield(
                      myHint: 'input angka 1',
                      txtController: txtangka1,
                    ),
                    const SizedBox(height: 16),
                    CustomTextfield(
                      myHint: 'input angka 2',
                      txtController: txtangka2,
                    ),
                    const SizedBox(height: 24),

                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Tambah'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // tryParse: kalau kosong/bukan angka, dianggap 0
                        final a = double.tryParse(txtangka1.text) ?? 0;
                        final b = double.tryParse(txtangka2.text) ?? 0;
                        controller.tambah(a, b);
                      },
                    ),
                    const SizedBox(height: 24),


                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.redAccent.shade200),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Hasil',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          // Obx = otomatis update kalau hasilHitung berubah
                          Obx(
                                () => Text(
                              controller.hasilHitung.value.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}