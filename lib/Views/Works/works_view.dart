import 'package:flutter/material.dart';

class WorksView extends StatelessWidget {
  const WorksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
    Center(child: Text('Worksページ', style: TextStyle(fontSize: 32))),
        ],
      ),
    );
  }
}