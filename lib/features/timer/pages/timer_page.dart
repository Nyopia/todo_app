import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zamanlayıcı')),
      body: const Center(child: Text('Zamanlayıcı Sayfası')),
    );
  }
}
