import 'package:flutter/material.dart';
import 'package:my_figma_app/intro/intro_screen.dart';

class ResultNB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결과 페이지")),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: 1600,
          child: Stack(
            children: [
              // 콘텐츠 부분
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(height: 121),
                    Text(
                      'Püffy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF87A0B3),
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.36,
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      width: 323,
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/puffy_image.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    Text(
                      '주의',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6E635C),
                        fontSize: 44,
                        fontFamily: 'SUITE',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 32),
                    _infoCard('💧수분이 부족했을 수 있어요💧\n변 상태는 정상이지만,\n수분 부족이나 단백질 급식 문제가\n가능성이 있어요.'),
                    SizedBox(height: 32),
                    _infoCard('🐶 이렇게 도와주세요 🐶\n깨끗한 물을 자주 갈아주고,\n습식 사료나 닭고기 육수로 수분 섭취를\n도와주세요.\n\n사료의 단백질 함량도 확인해\n조절해보는 것이 좋아요.'),
                    SizedBox(height: 32),
                    _infoCard('💡건강 관찰 꿀팁💡\n배변 외에도 소변 냄새나 양도 함께\n체크해보세요.\n\n지린 냄새가 계속되거나\n활력이 줄어든다면\n병원 방문을 추천드려요.'),
                    SizedBox(height: 50),
                  ],
                ),
              ),

              // ✅ 집 아이콘 (직접 구현)
              Positioned(
                left: 330,
                top: 1320,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const IntroScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/home_icon.png',
                    width: 51,
                    height: 51,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF6E635C),
          fontSize: 20,
          fontFamily: 'SUITE',
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
    );
  }
}
