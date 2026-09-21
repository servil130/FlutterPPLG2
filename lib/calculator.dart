import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Layar tampilan
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Tombol-tombol
            Expanded(
              flex: 4,
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(12),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  _buildButton('C', bg: Colors.grey.shade400, fg: Colors.black),
                  _buildButton('±', bg: Colors.grey.shade400, fg: Colors.black),
                  _buildButton('%', bg: Colors.grey.shade400, fg: Colors.black),
                  _buildButton('÷', bg: Colors.orange),

                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('×', bg: Colors.orange),

                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('−', bg: Colors.orange),

                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('+', bg: Colors.orange),

                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton('⌫', bg: Colors.grey.shade800),
                  _buildButton('=', bg: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      String text, {
        Color bg = const Color(0xFF333333),
        Color fg = Colors.white,
      }) {
    return Material(
      color: bg,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {}, // belum ada fungsi
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: fg,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}