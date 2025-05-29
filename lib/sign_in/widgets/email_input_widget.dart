import 'package:flutter/material.dart';

/// 이메일 입력 필드 위젯
class EmailInputWidget extends StatelessWidget {
  // 외부에서 입력값을 가져오기 위한 컨트롤러
  final TextEditingController controller;

  const EmailInputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 라벨 텍스트
        const Text(
          'E-mail',
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8), // 간격
        // 이메일 입력창
        TextField(
          controller: controller, // 외부에서 받은 컨트롤러 사용
          keyboardType: TextInputType.emailAddress, // 키보드 타입: 이메일
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: 'Enter your email', // 힌트 텍스트
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
