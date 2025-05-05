import 'package:flutter/material.dart';

class Result1Title extends StatelessWidget {
  const Result1Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // ✅ "Püffy" 텍스트
        Text(
          'Püffy',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF87A0B3),
            fontSize: 36,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 1.5,
            letterSpacing: -0.36,
          ),
        ),
        SizedBox(height: 20),

        // ✅ "심각한 이상" 타이틀
        Text(
          '심각한 이상',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6E635C),
            fontSize: 44,
            fontFamily: 'SUITE',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
