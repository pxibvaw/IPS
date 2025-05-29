import 'package:flutter/material.dart';
import 'widgets/intro_background.dart';
import 'widgets/dog_info_widget.dart';
import 'widgets/calendar_widget.dart';
import 'widgets/search_button.dart';

class IntroScreen extends StatelessWidget {
  final String name;
  final String birth;
  final String species;
  final String? weight;

  const IntroScreen({
    super.key,
    required this.name,
    required this.birth,
    required this.species,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const IntroBackground(),
          Column(
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/propuppy.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DogInfoWidget(
                        name: name,
                        birth: birth,
                        species: species,
                        weight: weight != null ? double.tryParse(weight!) : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFF79A0FF),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: CalendarWidget(
                  onDateSelected: (selectedDate, note) {},
                ),
              ),
            ],
          ),
          const SearchButton(),
        ],
      ),
    );
  }
}
