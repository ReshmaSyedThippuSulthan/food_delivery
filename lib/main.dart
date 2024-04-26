import 'package:flutter/material.dart';
import 'package:food_delivery/constant.dart';
import 'package:food_delivery/login_screen.dart';

void main() {
  runApp(
    const InitialScreen(),
  );
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
