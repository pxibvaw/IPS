import 'package:flutter/material.dart';
import 'package:my_figma_app/intro/intro_screen.dart';

class ResultEMERGENCY extends StatelessWidget {
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
                          image: AssetImage("assets/images/ddong_emergency.png"),
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
                    _infoCard('💩 위급한 증상이 감지되었어요 💩\n변 상태, 횟수, 냄새 등 여러 지표에서\n건강에 이상 신호가 확인되었어요.\n현재 상태는 응급에 해당하며\n즉시 병원 진료가 필요해요.'),
                    SizedBox(height: 32),
                    _infoCard('🐶 이렇게 도와주세요 🐶\n아이의 상태를 안정적으로\n유지할 수 있도록\n물과 음식은 잠시 중단하고,\n곧바로 가까운 동물병원을\n방문해주세요.\n지연되면 상태가 악화될 수 있어요.'),
                    SizedBox(height: 32),
                    _infoCard('💡 건강 관찰 꿀팁 💡\n이전 배변 사진이나 정보를\n수의사에게 전달하면 진단에\n큰 도움이 돼요.\n당황하지 마시고,\n빠르게 병원을 향해 주세요.'),
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
