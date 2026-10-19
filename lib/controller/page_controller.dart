import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  String username = "-";
  String namaLengkap = "-";

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map?;
    username = args?["username"] ?? "-";
    namaLengkap = args?["nama_lengkap"] ?? "-";
  }
}