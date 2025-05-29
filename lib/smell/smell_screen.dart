import 'package:flutter/material.dart';
import 'package:my_figma_app/count/count_screen.dart';

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
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final imagePath = args?['imagePath'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset('assets/ddong_searchDog.png', width: 160),
                const SizedBox(height: 20),
                const Text(
                  '강아지(이)의 응가 냄새는 어땠나요?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 30),
            ...List.generate(smellOptions.length, (index) {
              final selected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: GestureDetector(
                  onTap: () => setState(() => selectedIndex = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: selected ? Colors.black : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        smellOptions[index],
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            if (selectedIndex != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CountScreen(),
                      settings: RouteSettings(arguments: {
                        'imagePath': imagePath,
                        'smell': smellOptions[selectedIndex!]
                      }),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
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
