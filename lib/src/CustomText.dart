import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String myText;
  const CustomText({super.key, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}