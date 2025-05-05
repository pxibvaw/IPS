import 'package:flutter/material.dart';

class Result1Background extends StatelessWidget {
  const Result1Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/bg_result1.png', // ✅ 배경 이미지 경로
        fit: BoxFit.cover, // 화면에 맞게 꽉 채움
      ),
    );
  }
}
