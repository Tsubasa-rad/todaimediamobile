import 'package:flutter/material.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

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