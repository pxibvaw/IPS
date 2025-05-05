import 'package:flutter/material.dart';

import 'package:my_figma_app/result_1/result1_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/upload',
      routes: {

        '/result_1': (context) => const Result1Screen(),

      },
    );
  }
}
