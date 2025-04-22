import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Works/byte_view.dart';

class InternView extends StatelessWidget {
  const InternView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/topSmat.png",
            fit: BoxFit.fitHeight,
          ),
          TopWorksTitleTextWidget(
            title: "新着案件一覧　　-全3件-",
            sizeWith: size.width >= 930 ? 930 : size.width,
          ),
        ],
      ),
    );
  }
}
