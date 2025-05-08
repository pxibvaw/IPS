import 'package:flutter/material.dart';
import 'widgets/smell_button.dart';
import '/count/count_screen.dart'; // 다음 화면

class SmellScreen extends StatefulWidget {
  @override
  State<SmellScreen> createState() => _SmellScreenState();
}

class _SmellScreenState extends State<SmellScreen> {
  final List<String> smellOptions = [
    '시큼했어요',
    '지린내 같아요',
    '심한 악취였어요',
    '피냄새 같았어요',
    '거의 냄새가 안났어요',
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          children: [
            // 이미지 + 질문
            Column(
              children: [
                Image.asset('lib/assets/searchDog.png', width: 160),
                const SizedBox(height: 20),
                const Text(
                  '강아지(이)의 응가 냄새는 어땠나요?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 선택 버튼들
            ...List.generate(smellOptions.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SmellOptionButton(
                  label: smellOptions[index],
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              );
            }),

            const Spacer(),

            // NEXT 버튼
            if (selectedIndex != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CountScreen(), // countScreen으로
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('NEXT'),
              ),
          ],
        ),
      ),
    );
  }
}
