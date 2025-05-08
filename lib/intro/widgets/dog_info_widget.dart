import 'package:flutter/material.dart';

class DogInfoWidget extends StatelessWidget {
  final String name;
  final String birth;
  final String species;
  final double? weight;

  const DogInfoWidget({
    super.key,
    required this.name,
    required this.birth,
    required this.species,
    this.weight,
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
          'name: $name\nage: $birth years\nspecies: $species',
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
