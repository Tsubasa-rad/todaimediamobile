import 'package:flutter/material.dart';

class CircleNaviView extends StatelessWidget {
  const CircleNaviView({super.key});

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