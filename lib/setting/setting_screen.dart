import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_figma_app/intro/intro_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  TextInputFormatter koreanEnglishOnlyFormatter = TextInputFormatter.withFunction(
        (oldValue, newValue) {
      final text = newValue.text;
      final regExp = RegExp(r'^[\uac00-\ud7a3a-zA-Z]*');
      if (regExp.hasMatch(text) || text.isEmpty) {
        return newValue;
      }
      return oldValue;
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "welcome!",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 16),
            const Text("Name", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: nameController,
                inputFormatters: [koreanEnglishOnlyFormatter],
                decoration: InputDecoration(
                  hintText: "이름 입력",
                  filled: true,
                  fillColor: const Color(0xfff7f8f8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Date of Birth", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: dobController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: "YYYYMMDD",
                  filled: true,
                  fillColor: const Color(0xfff7f8f8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Species", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: speciesController,
                inputFormatters: [koreanEnglishOnlyFormatter],
                decoration: InputDecoration(
                  hintText: "종 입력 (예: 강아지 / Dog)",
                  filled: true,
                  fillColor: const Color(0xfff7f8f8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Weight", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: "몸무게",
                      filled: true,
                      fillColor: const Color(0xfff7f8f8),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 51,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xff8daeff),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text("KG",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ),
              ]),
            ),

            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => IntroScreen(
                        name: nameController.text,
                        birth: dobController.text,
                        species: speciesController.text,
                        weight: weightController.text,
                      ),
                    ),
                  );
                }
              },
              child: Container(
                width: 315,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xff8daeff),
                  borderRadius: BorderRadius.circular(99),
                ),
                alignment: Alignment.center,
                child: const Text("Next",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
