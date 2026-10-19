import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttercoba/src/CustomTextField.dart';
import 'package:fluttercoba/src/CustomButton.dart';
import 'package:fluttercoba/src/CustomText.dart';
import '../routes.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController txtNamaLengkap = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtWa = TextEditingController();

  String? selectedGender;

  @override
  void dispose() {
    txtNamaLengkap.dispose();
    txtEmail.dispose();
    txtWa.dispose();
    super.dispose();
  }

  void _submit() {
    final nama = txtNamaLengkap.text.trim();
    final email = txtEmail.text.trim();
    final wa = txtWa.text.trim();

    if (nama.isEmpty || email.isEmpty || wa.isEmpty || selectedGender == null) {
      Get.snackbar("Error", "Semua field harus diisi");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Format email tidak valid");
      return;
    }

    Get.toNamed(Routes.confirm_registration, arguments: {
      "email": email,
      "jenis_kelamin": selectedGender,
      "no_wa": wa,
      "nama_lengkap": nama,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(myText: "Registration"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
              myHint: "nama lengkap",
              txtController: txtNamaLengkap,
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: "input email",
              txtController: txtEmail,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                hintText: "Pilih Jenis Kelamin",
              ),
              initialValue: selectedGender,
              items: ['Laki-laki', 'Perempuan'].map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: CustomText(myText: val),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: "input no WA",
              txtController: txtWa,
            ),
            const SizedBox(height: 24),
            CustomButton(
              myLabel: "Submit",
              onTap: _submit,
            ),
          ],
        ),
      ),
    );
  }
}