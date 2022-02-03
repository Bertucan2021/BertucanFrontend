// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFEEFF2),
      body: const Center(
        child: const Text('Home Page'),
      ),
    );
  }
}
