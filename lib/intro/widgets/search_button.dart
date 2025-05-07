import 'package:flutter/material.dart';
import 'package:my_figma_app/upload/upload_screen.dart'; // 실제 경로에 맞게 수정해 주세요

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 20,
      child: GestureDetector(
        onTap: () {
          // UploadScreen으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UploadScreen()),
          );
        },
        child: Image.asset(
          'assets/ddong_search.png', // ✅ 버튼 이미지
          width: 74,
          height: 78,
        ),
      ),
    );
  }
}
