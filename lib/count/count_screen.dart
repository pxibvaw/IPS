import 'package:flutter/material.dart';
import 'package:my_figma_app/loading/loading_screen.dart';

class CountScreen extends StatefulWidget {
  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int? selectedDurationIndex;
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

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final imagePath = args?['imagePath'];
    final smell = args?['smell'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/ddong_searchDog.png", width: 163, height: 163),
            const SizedBox(height: 12),
            const Text(
              "강아지(이)의 응가 횟수를\n알려주세요!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 32),
            Container(
              width: 300,
              height: selectedDurationIndex == 0 ? 300
                  : selectedDurationIndex == 1 ? 240 : 157,
              decoration: BoxDecoration(
                color: const Color(0xfff2f6f9),
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text("얼마동안", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 14),
                  Row(
                    children: List.generate(durations.length, (index) {
                      final isSelected = selectedDurationIndex == index;
                      return GestureDetector(
                        onTap: () => onDurationSelected(index),
                        child: Container(
                          width: index == 0 ? 66 : 99,
                          height: 41,
                          margin: const EdgeInsets.only(right: 12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF86B8FF) : const Color(0xFFEAF3FF),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            durations[index],
                            textAlign: TextAlign.center,
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
                  if (selectedDurationIndex == 0) ...[
                    const SizedBox(height: 32),
                    const Text("얼마나", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 14),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(subOptionsFor1Day.length, (index) {
                        final isSelected = selectedSubOptionIndex == index;
                        double buttonWidth = index == 4 ? 83 : 66;
                        return GestureDetector(
                          onTap: () => onSubOptionSelected(index),
                          child: Container(
                            width: buttonWidth, height: 41,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF86B8FF) : const Color(0xFFEAF3FF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              subOptionsFor1Day[index],
                              textAlign: TextAlign.center,
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
                  if (selectedDurationIndex == 1) ...[
                    const SizedBox(height: 32),
                    const Text("48시간 이내 배변 여부", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 14),
                    Row(
                      children: List.generate(subOptionsForNone.length, (index) {
                        final isSelected = selectedSubOptionIndex == index;
                        return GestureDetector(
                          onTap: () => onSubOptionSelected(index),
                          child: Container(
                            width: 66,
                            height: 41,
                            margin: const EdgeInsets.only(right: 12),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF86B8FF) : const Color(0xFFEAF3FF),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              subOptionsForNone[index],
                              textAlign: TextAlign.center,
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
                ],
              ),
            ),
            const Spacer(),
            if (selectedSubOptionIndex != null)
              GestureDetector(
                onTap: () {
                  final selectedCount = selectedDurationIndex == 0
                      ? subOptionsFor1Day[selectedSubOptionIndex!]
                      : selectedSubOptionIndex == 0 ? '48시간 이내 1번' : '48시간 이상 안함';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoadingScreen(
                        selectedImagePath: imagePath,
                        selectedSmell: smell,
                        selectedCount: selectedCount,
                        selectedAmount: '보통', // 필요 시 이후 화면에서 선택받도록 수정 가능
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 342,
                  height: 47,
                  decoration: BoxDecoration(
                    color: const Color(0xffebf3ff),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "분석",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
