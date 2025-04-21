import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(child: Text('記事ページ', style: TextStyle(fontSize: 32))),
        ],
      ),
    );
  }
}
