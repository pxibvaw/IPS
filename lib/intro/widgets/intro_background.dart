import 'package:flutter/material.dart';

class IntroBackground extends StatelessWidget {
  const IntroBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg_intro.png', // ✅ intro 화면 배경 이미지 경로
        fit: BoxFit.cover, // 전체 화면에 맞게 이미지 확장
      ),
    );
  }
}
