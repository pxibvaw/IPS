import 'package:flutter/material.dart';
import 'package:my_figma_app/intro/intro_screen.dart';

class ResultNORMAL extends StatelessWidget {
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
                          image: AssetImage("assets/images/ddong_normal.png"),
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
                    _infoCard('💩 오늘 변 상태가 아주 좋아요!\n모양, 수분, 냄새까지\n모두 정상적인 건강한 변이에요.\n소화와 장 건강이 모두 잘 유지되고 있어요'),
                    SizedBox(height: 32),
                    _infoCard('🐶 이렇게 도와주세요!\n지금처럼 균형 잡힌 식사와\n충분한 수분 섭취를 계속 유지해 주세요.\n산책과 놀이는 적당한 활동량을 챙겨주면\n소화 건강에도 좋아요!'),
                    SizedBox(height: 32),
                    _infoCard('💡 건강 관찰 꿀팁\n눈·피부 상태, 활력, 식욕을 함께\n확인해 주세요.\n설사가 2일 이상 지속되거나\n무기력/탈수 증상이 보이면\n빠르게 병원에 가는 것이 좋아요.'),
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
