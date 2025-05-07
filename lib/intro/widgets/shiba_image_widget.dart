import 'package:flutter/material.dart';

class ShibaImageWidget extends StatelessWidget {
  const ShibaImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 98,
      left: 29,
      child: Container(
        width: 132,
        height: 132,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/puppy.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
