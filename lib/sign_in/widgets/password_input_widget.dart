import 'package:flutter/material.dart';

/// 비밀번호 입력 필드 위젯
class PasswordInputWidget extends StatelessWidget {
  // 외부에서 입력값을 가져오기 위한 컨트롤러
  final TextEditingController controller;

  const PasswordInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨 텍스트
        const Text(
          'Password',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8), // 간격
        // 비밀번호 입력창
        TextField(
          controller: controller, // 외부에서 받은 컨트롤러 사용
          obscureText: true, // 입력값 가리기 ●●●●
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: 'Enter your password', // 힌트 텍스트
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // 둥근 테두리
              borderSide: const BorderSide(color: Color(0xFFD9D9D9)), // 테두리 색상
            ),
            filled: true,
            fillColor: Colors.white, // 배경 색상
          ),
        ),
      ],
    );
  }
}
