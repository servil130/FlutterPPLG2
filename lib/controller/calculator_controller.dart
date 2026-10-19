import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilHitung = 0.0.obs; // obs digunakan untuk update ke UI page
  // method tambah kurang kali dan bagi
  void tambah(double angka1, double angka2) {
    double hasiltambah = angka1 + angka2;
    hasilHitung.value = hasiltambah;
  }
}