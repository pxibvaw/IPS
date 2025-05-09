import 'package:flutter/material.dart';
import 'package:my_figma_app/sign_in/widgets/email_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/password_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/login_button.dart';
import 'package:my_figma_app/sign_in/widgets/sign_in_background.dart';
import 'package:my_figma_app/sign_in/widgets/signup_text_widget.dart';

/// 로그인 화면 전체 구성 위젯
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // 이메일 입력값을 제어할 컨트롤러
  final TextEditingController emailController = TextEditingController();

  // 비밀번호 입력값을 제어할 컨트롤러
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // 메모리 누수 방지를 위해 컨트롤러 해제
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // 배경 이미지와 내용 위젯을 겹쳐 배치하기 위해 Stack 사용
      body: Stack(
        children: [
          const SignInBackground(), // 배경 + 캐릭터 이미지
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200), // 상단 여백
                // 환영 문구
                const Text(
                  'welcome!',
                  style: TextStyle(
                    color: Color(0xFF323131),
                    fontSize: 48,
                    fontFamily: 'Gloria Hallelujah',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40),
                // 이메일 입력 필드
                EmailInputWidget(controller: emailController),
                const SizedBox(height: 20),
                // 비밀번호 입력 필드
                PasswordInputWidget(controller: passwordController),
                const SizedBox(height: 30),
                // 로그인 버튼
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 30),
                // 계정 생성 문구 및 링크
                const SignupTextWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
