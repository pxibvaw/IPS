import 'package:flutter/material.dart';
import 'dart:io' show File;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;
import '../api/api.dart';

class ResultScreen extends StatefulWidget {
  final String selectedImagePath;
  final String selectedSmell;
  final String selectedCount;
  final String selectedAmount;

  const ResultScreen({
    super.key,
    required this.selectedImagePath,
    required this.selectedSmell,
    required this.selectedCount,
    required this.selectedAmount,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String prediction = '';
  String level = '';
  int score = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _callBackend();
  }

  void _callBackend() async {
    print("🐾 백엔드 호출 시작");

    if (kIsWeb) {
      final formData = html.FormData();
      formData.append('filename', widget.selectedImagePath);
      formData.append('count_input', widget.selectedCount);
      formData.append('smell_input', widget.selectedSmell);
      formData.append('amount_input', widget.selectedAmount);

      final request = html.HttpRequest();
      request
        ..open('POST', 'http://localhost:8000/predict')
        ..onLoadEnd.listen((event) {
          if (request.status == 200) {
            final response = jsonDecode(request.responseText!);
            setState(() {
              prediction = response['prediction'];
              level = response['level'];
              score = response['score'];
              isLoading = false;
            });
          } else {
            setState(() {
              prediction = '오류 발생';
              level = '-';
              score = -1;
              isLoading = false;
            });
          }
        })
        ..onError.listen((event) {
          setState(() {
            prediction = '오류 발생';
            level = '-';
            score = -1;
            isLoading = false;
          });
        })
        ..send(formData);
    } else {
      try {
        final result = await sendPoopData(
          imageFile: File(widget.selectedImagePath),
          countInput: widget.selectedCount,
          smellInput: widget.selectedSmell,
          amountInput: widget.selectedAmount,
        );
        setState(() {
          prediction = result['prediction'];
          level = result['level'];
          score = result['score'];
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          prediction = '오류 발생';
          level = '-';
          score = -1;
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3FF),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('예측 결과: $prediction', style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 8),
                  Text('위험 등급: $level', style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 8),
                  Text('점수: $score', style: const TextStyle(fontSize: 22)),
                ],
              ),
      ),
    );
  }
}
