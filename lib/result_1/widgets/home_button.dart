import 'package:flutter/material.dart';
import 'package:my_figma_app/intro/intro_screen.dart';

// 홈 화면 연결 버튼
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ✅ Navigator.of(context)를 사용하여 IntroScreen으로 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
        );
      },
      child: Image.asset(
        'assets/home_icon.png', // ✅ 홈 아이콘 이미지 경로
        width: 51,
        height: 51,
      ),
    );
  }
}
