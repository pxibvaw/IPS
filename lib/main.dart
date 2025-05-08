import 'package:flutter/material.dart';
import 'package:my_figma_app/start/start_screen.dart'; // 앱 시작 화면으로 설정

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Püffy',
      theme: ThemeData(
        fontFamily: 'SUITE', // 폰트 썼다면 여기에 맞춰 지정
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const StartScreen(), // 첫화면 startscreen 3초 보여주기
    );
  }
}
