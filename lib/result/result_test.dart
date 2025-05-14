//이 파일은 ai 결과값을 받아오기 이전까지 어떤 화면으로 연결할 수 없어서
//일단 임시로 경로 오류를 방지하기 위해 생성된 dart파일
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF3FF),
      body: Center(
        child: Text(
          '분석 결과 화면 (추후 AI 결과 연동 예정)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
