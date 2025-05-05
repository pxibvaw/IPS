import 'package:flutter/material.dart';

class DogInfoWidget extends StatelessWidget {
  final String name;
  final int age;
  final String species;

  const DogInfoWidget({
    super.key,
    required this.name,
    required this.age,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 110,
      left: 206,
      child: SizedBox(
        width: 180,
        height: 107,
        child: Text(
          'name: $name\nage: $age years\nspecies: $species',
          style: const TextStyle(
            color: Color(0xFF402E22),
            fontSize: 21,
            fontFamily: 'SUITE',
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
