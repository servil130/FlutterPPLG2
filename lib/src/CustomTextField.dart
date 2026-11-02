import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final bool obscureText;
  const CustomTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: txtController,
      obscureText: obscureText,
      decoration: InputDecoration(
        hint: Text(myHint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}