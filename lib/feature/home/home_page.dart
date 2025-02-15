import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Home",
            style: TextStyle(color: Colors.blueAccent),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home),
          )
        ],
      ),
    );
  }
}
