import 'package:flutter/material.dart';
import 'package:my_figma_app/intro/intro_screen.dart';
import 'package:my_figma_app/setting/setting_screen.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE3CCBC), // 버튼 색상
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), // 둥근 버튼
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      ),
      onPressed: () {
        // 입력값 가져오기
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        // 예시로 고정된 아이디/비밀번호 사용 (추후 백엔드 연동 가능)
        const validEmail = "test@example.com";
        const validPassword = "1234";

        if (email.isEmpty || password.isEmpty) {
          // 둘 중 하나라도 비어 있으면 경고창 표시
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('입력 오류'),
              content: Text('이메일과 비밀번호를 모두 입력해주세요.'),
            ),
          );
        } else if (email == validEmail && password == validPassword) {
          // 아이디와 비밀번호가 일치하면 intro_screen으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SettingScreen()),
          );
        } else {
          // 아이디가 없거나 비밀번호가 틀리면 팝업 표시
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('로그인 실패'),
              content: Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
            ),
          );
        }
      },
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          letterSpacing: 0.10,
        ),
      ),
    );
  }
}
