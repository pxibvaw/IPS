import 'package:flutter/material.dart';
import 'package:my_figma_app/result_lbs/result_lbs_screen.dart'; // 파일 경로는 실제 구조에 맞게 조정하세요.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Püffy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResultNB(),
    );
  }
}
