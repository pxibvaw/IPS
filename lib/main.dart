import 'package:flutter/material.dart';
import 'sign_in/sign_in_screen.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        Start(),
      ]),
    );
  }
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundImageUrl = 'assets/bg_start.png';
    const characterImageUrl = 'assets/ddong_search.png';

    return Column(
      children: [
        Container(
          width: 412,
          height: 917,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImageUrl), // ✅ 수정됨
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 82,
                top: 224,
                child: Container(
                  width: 249,
                  height: 249,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(characterImageUrl), // ✅ 수정됨
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 155,
                top: 443,
                child: Text(
                  'Püffy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE3CCBC),
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 1.50,
                    letterSpacing: -0.40,
                  ),
                ),
              ),
              const Positioned(
                left: 48,
                top: 738,
                child: SizedBox(
                  width: 316,
                  height: 123,
                  child: Text(
                    'poop has something to say!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF79A0FF),
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.50,
                      letterSpacing: -0.18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
