import 'package:flutter/material.dart';

class Result1Description extends StatelessWidget {
  const Result1Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '이후 출혈이 확인되면,\n즉시 병원에 내원해주시기 바랍니다.\n반려견에게 건강상의 문제가\n발생할 수 있습니다.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF6E635C),
          fontSize: 27,
          fontFamily: 'SUITE',
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
      ),
    );
  }
}
