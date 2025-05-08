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
                    _infoCard('🦠장내 균형이 살짝 흐트러졌어요🦠\n변은 정상이지만,\n장내 유산균 균형이 깨졌거나\n식단 변화에 장이 민감하게\n반응했을 수 있어요.'),
                    SizedBox(height: 32),
                    _infoCard('🐶 이렇게 도와주세요 🐶\n프로바이오틱스나 유산균 보충제를\n급여해보세요.\n\n사료를 갑자기 바꾸기보다는,\n1~2주간 천천히 섞어가며 바꿔주세요.\n\n간식도 평소에 먹던 익숙한 재료로\n위주로 급여하는 것이 좋아요.'),
                    SizedBox(height: 32),
                    _infoCard('💡건강 관찰 꿀팁💡\n배변 후 냄새와 양상을 가볍게\n메모해두는도 좋아요.\n\n3일 이상 묘한 냄새가 계속되면,\n소화기 질환이나 흡수 장애일 수 있으니\n병원을 방문해보세요.'),
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
