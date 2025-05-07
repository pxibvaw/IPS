import 'package:flutter/material.dart';
import 'package:my_figma_app/setting/setting_screen.dart'; 

/// 하단 "계정이 없으신가요?" 문구와 계정 생성 링크 위젯
class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
      children: [
        // 기본 문구
        const Text(
          "Don't you have an account?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            letterSpacing: 0.10,
          ),
        ),
        const SizedBox(width: 8), // 두 문장 사이 여백
        // 파란색 링크 텍스트 (탭하면 SettingScreen으로 이동)
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingScreen()),
            );
          },
          child: const Text(
            'Creating an Account',
            style: TextStyle(
              color: Color(0xFF4587CA),
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              height: 2.29,
            ),
          ),
        ),
      ],
    );
  }
}
