import 'package:flutter/material.dart';
import 'package:my_figma_app/sign_in/widgets/email_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/password_input_widget.dart';
import 'package:my_figma_app/sign_in/widgets/login_button.dart';
import 'package:my_figma_app/sign_in/widgets/sign_in_background.dart';
import 'package:my_figma_app/sign_in/widgets/signup_text_widget.dart';
import 'package:my_figma_app/setting/setting_screen.dart'; // ✅ 추가

/// 로그인 화면 전체 구성 위젯
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // 로그인 시도 후 바로 SettingScreen으로 이동
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const SettingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SignInBackground(),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 200),
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
                EmailInputWidget(controller: emailController),
                const SizedBox(height: 20),
                PasswordInputWidget(controller: passwordController),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3CCBC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  ),
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
                ),
                const SizedBox(height: 30),
                const SignupTextWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
