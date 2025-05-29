import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_figma_app/sign_in/sign_in_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 배경 이미지
          Image.asset(
            "assets/bg_start.png",
            fit: BoxFit.cover,
          ),

          // 중앙 콘텐츠
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ddong_search.png",
                width: 249,
                height: 249,
              ),
              const SizedBox(height: 20),
              const Text(
                "Püffy",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              const Text(
                "poop has something to say!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF79A0FF) // 색상 적용됨!
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
