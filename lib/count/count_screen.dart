import 'package:flutter/material.dart';
import 'package:my_figma_app/loading/loading_screen.dart';

class CountScreen extends StatefulWidget {
  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int? selectedDurationIndex; // 0: 1일, 1: 하루 이상 안함
  int? selectedSubOptionIndex;

  final List<String> durations = ['1일', '하루 이상 안함'];
  final List<String> subOptionsFor1Day = ['1회', '2회', '3회', '4회', '5회 이상'];
  final List<String> subOptionsForNone = ['O', 'X'];

  void onDurationSelected(int index) {
    setState(() {
      selectedDurationIndex = index;
      selectedSubOptionIndex = null;
    });
  }

  void onSubOptionSelected(int index) {
    setState(() {
      selectedSubOptionIndex = index;
    });
  }

  Widget buildHowMuchBox() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFD3DCE2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text("얼마나", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(subOptionsFor1Day.length, (index) {
              final isSelected = selectedSubOptionIndex == index;
              return GestureDetector(
                onTap: () => onSubOptionSelected(index),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF86B8FF) : Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    subOptionsFor1Day[index],
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

  Widget buildCheck48hBox() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFD3DCE2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text("48시간 이내 배변 여부", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(subOptionsForNone.length, (index) {
              final isSelected = selectedSubOptionIndex == index;
              return GestureDetector(
                onTap: () => onSubOptionSelected(index),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF86B8FF) : Color(0xFFEAF3FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    subOptionsForNone[index],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4F1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/ddong_searchDog.png", width: 163, height: 163),
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
            if (selectedDurationIndex == 0) buildHowMuchBox(),
            if (selectedDurationIndex == 1) buildCheck48hBox(),
            const SizedBox(height: 24),
            if (selectedSubOptionIndex != null)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoadingScreen()),
                  );
                },
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
