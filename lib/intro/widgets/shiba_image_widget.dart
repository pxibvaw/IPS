import 'package:flutter/material.dart';

class ResultNB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white,
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
                    image: AssetImage("assets/images/ddong_caution.png"),
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
              _infoCard(
                '💩변 상태는 정상이지만 \n냄새가 강하고 횟수가 많아요💩\n단백질이나 지방을 많이 먹었거나,\n소화 흡수가 완벽하지 않을 수 있어요.\n\n식단 균형이 무너졌을 가능성도 있어요.',
              ),
              SizedBox(height: 32),
              _infoCard(
                '🐶 이렇게 도와주세요 🐶\n\n고단백 사료를 먹고 있다면 양을 줄여주세요.\n\n식이섬유가 풍부한 간식을 더해보는 것도 좋아요.\n\n프로바이오틱스이 장 건강을 도와줄 수 있어요.\n\n급여량은 과하지 않도록 조절하고, 물도 자주 제공해주세요.',
              ),
              SizedBox(height: 32),
              _infoCard(
                '💡 건강 관찰 꿀팁 💡\n\n배변 후 냄새와 횟수를 메모해두면 좋아요.\n\n3일 이상 심한 냄새가 계속되면,\n소화기 질환이나 흡수 장애일 수 있으니 병원을 방문해보세요.',
              ),
              SizedBox(height: 50),
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
