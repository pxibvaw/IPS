import 'package:flutter/material.dart';

/// 로그인 화면의 배경과 캐릭터 이미지를 보여주는 위젯
class SignInBackground extends StatelessWidget {
  const SignInBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 전체 배경 이미지 (bg_signin.png)
        Positioned.fill(
          child: Image.asset(
            'assets/bg_signin.png', // 배경 이미지 경로 (assets 폴더에 있어야 함)
            fit: BoxFit.cover, // 화면 전체 채우기
          ),
        ),
        // 오른쪽 상단에 캐릭터 이미지 배치 (ddong_normal.png)
        Positioned(
          top: 134,
          right: 0,
          child: Image.asset(
            'assets/ddong_normal.png',
            width: 151,
            height: 151,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
