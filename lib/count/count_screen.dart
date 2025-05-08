import 'package:flutter/material.dart';
import 'package:my_figma_app/count/count_screen.dart';

class CountScreen extends StatefulWidget {
  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int? selectedDurationIndex; // 0: 1일, 1: 하루 이상 안함
  int? selectedSubOptionIndex;

  List<String> durations = ['1일', '하루 이상 안함'];
  List<String> subOptionsFor1Day = ['1회', '2회', '3회', '4회', '5회'];
  List<String> subOptionsForNone = ['O', 'X'];

  void onDurationSelected(int index) {
    setState(() {
      selectedDurationIndex = index;
      selectedSubOptionIndex = null; // 초기화
    });
  }

  void onSubOptionSelected(int index) {
    setState(() {
      selectedSubOptionIndex = index;
    });
  }

  Widget buildSubOptionsBox() {
    final is1Day = selectedDurationIndex == 0;
    final subOptions = is1Day ? subOptionsFor1Day : subOptionsForNone;

    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFD3DCE2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // 상단 선택 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(durations.length, (index) {
              final isSelected = selectedDurationIndex == index;
              return GestureDetector(
                onTap: () => onDurationSelected(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF86B8FF) : Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    durations[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Text(
            "얼마동안",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: List.generate(subOptions.length, (index) {
              final isSelected = selectedSubOptionIndex == index;
              return GestureDetector(
                onTap: () => onSubOptionSelected(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF86B8FF) : Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    subOptions[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void goToCountScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CountScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/searchDog.png", width: 163, height: 163),
            const SizedBox(height: 16),
            Text(
              "강아지(이)의 응가 횟수를\n알려주세요!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(durations.length, (index) {
                final isSelected = selectedDurationIndex == index;
                return GestureDetector(
                  onTap: () => onDurationSelected(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0xFF86B8FF) : Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      durations[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
            if (selectedDurationIndex != null) buildSubOptionsBox(),
            const SizedBox(height: 24),
            if (selectedSubOptionIndex != null)
              ElevatedButton(
                onPressed: goToCountScreen,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEBF3FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: const Text(
                  "분석",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
