import 'package:flutter/material.dart';

class Result1Image extends StatelessWidget {
  const Result1Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/ddong_smallab.png', // ✅ 변경된 이미지 파일 이름
        width: 255,
        height: 270,
        fit: BoxFit.cover,
      ),
    );
  }
}
