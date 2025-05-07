import 'package:flutter/material.dart';

// 아래 위젯 파일들 import (프로젝트 폴더에 맞게 경로 수정 필요)
import 'package:my_figma_app/sign_in/widgets/email_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/password_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/login_button.dart';
import 'package:my_figma_app/sign_in/widgets/sign_in_background.dart';
import 'package:my_figma_app/sign_in/widgets/signup_text_widget.dart';

/// 로그인 전체 화면을 구성하는 StatefulWidget
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // 이메일과 비밀번호 입력값을 제어할 컨트롤러 생성
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 배경 이미지 및 캐릭터 이미지
          const SignInBackground(),
          // 스크롤 가능하게 전체 내용을 감싸기
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200), // 상단 여백
                // 환영 인사 텍스트
                const Text(
                  'welcome!',
                  style: TextStyle(
                    color: Color(0xFF323131),
                    fontSize: 48,
                    fontFamily: 'Gloria Hallelujah',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 40), // 텍스트와 입력창 사이 간격
                // 이메일 입력창
                EmailInputWidget(controller: emailController),
                const SizedBox(height: 20),
                // 비밀번호 입력창
                PasswordInputWidget(controller: passwordController),
                const SizedBox(height: 30),
                // 로그인 버튼
                LoginButton(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(height: 30),
                // 하단 텍스트 링크
                const SignupTextWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
