import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 // 홈 화면 연결 경로

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ✅ 홈 화면으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const IntroScreen()),
        );
      },
      child: Image.asset(
        'assets/icons/home_icon.png', // ✅ 홈 아이콘 이미지 경로
        width: 51,
        height: 51,
      ),
    );
  }
}
