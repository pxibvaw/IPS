import 'package:flutter/material.dart';
import 'package:my_figma_app/result/result_test.dart';

class LoadingScreen extends StatefulWidget {
  final String selectedImagePath;
  final String selectedSmell;
  final String selectedCount;
  final String selectedAmount;

  const LoadingScreen({
    super.key,
    required this.selectedImagePath,
    required this.selectedSmell,
    required this.selectedCount,
    required this.selectedAmount,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            selectedImagePath: widget.selectedImagePath,
            selectedSmell: widget.selectedSmell,
            selectedCount: widget.selectedCount,
            selectedAmount: widget.selectedAmount,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg_result.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ddong_search.png',
                  width: 331,
                  height: 331,
                ),
                const SizedBox(height: 30),
                const Text(
                  '분석 중..',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
