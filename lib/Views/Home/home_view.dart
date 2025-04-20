import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
    Center(child: Text('🏠 Home Page', style: TextStyle(fontSize: 32))),
          Text("data"),
        ],
      ),
    );
  }
}
