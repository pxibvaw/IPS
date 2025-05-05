import 'package:flutter/material.dart';
import 'widgets/result1_background.dart';
import 'widgets/result1_title.dart';
import 'widgets/result1_image.dart';
import 'widgets/result1_description.dart';
import 'widgets/.home_button.dart';

class Result1Screen extends StatelessWidget {
  const Result1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ 배경 이미지 (패턴 배경)
          const Result1Background(),

          // ✅ 상단 타이틀 텍스트 (예: "Püffy" + "심각한 이상")
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: const Result1Title(),
          ),

          // ✅ 중앙 PNG 이미지 (똥 그림)
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: const Result1Image(),
          ),

          // ✅ 하단 설명 텍스트
          Positioned(
            top: 580,
            left: 0,
            right: 0,
            child: const Result1Description(),
          ),

          // ✅ 오른쪽 하단 홈 버튼 (메인으로 이동)
          Positioned(
            bottom: 40,
            right: 30,
            child: HomeButton(), // → 누르면 홈화면으로 이동
          ),
        ],
      ),
    );
  }
}
