import 'package:fluttercoba/model/makanan_model.dart';
import 'package:get/get.dart';

class ListMakananController extends GetxController{


  List<MakananModel> dataMakanan = [
    MakananModel(namaMakanan: "Nasi Uduk", harga: "5.000/porsi", rating: "⭐⭐⭐⭐⭐", review: "Nasi uduknya muantaps", deskripsi: "Perpaduan nasi uduk dan bawang goreng yang guring", gambarPath: "assets/image/nasi uduk.jpe"),
    MakananModel(namaMakanan: "Nasi Padang", harga: "6.000/porsi", rating: "⭐⭐⭐⭐⭐", review: "Nasi padangnya gurih apalagi saos khasnya", deskripsi: "Nasi padang khas minangkabau bumbu yang khas membuatnya gurih dan lezat saat di santap", gambarPath: "assets/image/nasi padang.jpe"),
    MakananModel(namaMakanan: "Sate Ayam", harga: "5.000/5 tusuk", rating: "⭐⭐⭐⭐", review: "sate ayamnya enak tapi bawangnya ga ada", deskripsi: "Sate ayam dengan bumbu kacang yang enak di lidah", gambarPath: "assets/image/Sate Ayam.jpe"),
    MakananModel(namaMakanan: "Paket Hemat Kantin", harga: "10.000/paket", rating: "⭐⭐⭐⭐", review: "paketnya hemat banget tapi sayurnya kurang cocok, tapi yang lainnya udah enak", deskripsi: "paket ayam, nasi, dan sayuran yang bisa menemani nutrisi pagi", gambarPath: "assets/image/paket.jpe"),
    MakananModel(namaMakanan: "Oseng Oseng ayam", harga: "13.0000", rating: "⭐⭐⭐⭐⭐", review: "oseng osengnya mantap banget pedasnya pas apalagi bumbu osengnya cocok", deskripsi: "oseng oseng ayam dengan bumbu yang di padukan dengan kecap dan cape membuatnya lezat", gambarPath: "assets/image/Oseng Ayam.jpe"),
  ];
}