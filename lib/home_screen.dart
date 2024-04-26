import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Home",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
