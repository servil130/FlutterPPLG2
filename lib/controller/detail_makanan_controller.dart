import 'package:fluttercoba/model/makanan_model.dart';
import 'package:get/get.dart';

class DetailMakananController extends GetxController {

  late MakananModel makanan;

  @override
  void onInit() {
    super.onInit();
    makanan = Get.arguments;
  }
}