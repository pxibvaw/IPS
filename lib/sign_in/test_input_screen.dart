import 'package:flutter/material.dart';
import 'widgets/email_input_widget.dart';

class TestInputScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test Email Input')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            EmailInputWidget(controller: emailController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Email: ${emailController.text}');
              },
              child: Text('출력'),
            )
          ],
        ),
      ),
    );
  }
}
