import 'package:flutter/material.dart';
import 'widgets/intro_background.dart';
import 'widgets/dog_info_widget.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/search_button.dart';
import 'widgets/shiba_image_widget.dart';


class IntroScreen extends StatelessWidget {
  final String name;
  final String birth;
  final String species;

  const IntroScreen({
    super.key,
    required this.name,
    required this.birth,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ✅ 배경 이미지
          const IntroBackground(),

          // ✅ 내용 배치
          Column(
            children: [
              const SizedBox(height: 60), // 상단 여백
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //시바 사진
                    const ShibaImageWidget(),
                    const SizedBox(width: 20),
                    // ✅ 강아지 정보
                    Expanded(
                      child: DogInfoWidget(
                        name: name,
                        birth: birth,
                        species: species,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ✅ 구분선
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFF79A0FF),
                ),
              ),

              const SizedBox(height: 16),

              // ✅ 캘린더 위젯
              Expanded(
                child: CalendarWidget(
                  onDateSelected: (selectedDate, note) {
                    // 예: 상태 저장, 화면 갱신 등
                  },
                ),
              ),

            ],
          ),

          // ✅ 똥 버튼 (업로드 화면으로 이동)
          const SearchButton(),
        ],
      ),
    );
  }
}
