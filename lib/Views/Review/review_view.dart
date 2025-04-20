import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Widgets/wave_painter.dart';
import 'package:todai_media_mobile/style.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTopSection(screenWidth),
          Center(child: Text('🏠 Home Page', style: TextStyle(fontSize: 32))),
          Text("data"),
        ],
      ),
    );
  }

  Widget buildTopSection(double screenWidth) {
    return CustomPaint(
      painter: WavePainter(color1: white, color2: base1Color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          const Text("東大最大の授業口コミサイト",
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Image.asset("assets/icons/reviews.png",
              width: screenWidth > 400 ? 400 : screenWidth - 40),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("managed by ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Image.asset("assets/icons/iconclrea.png", width: 30),
            ],
          ),
          const SizedBox(height: 25),
          if (screenWidth > 820)
            Image.asset("assets/images/口コミサイト_TOP_イラスト_transparent.png",
                width: 400),
          if (screenWidth <= 820)
            Image.asset("assets/images/口コミサイト_TOP_イラスト_transparent.png",
                width: screenWidth > 300 ? 300 : screenWidth),
          const SizedBox(height: 50),
          // SearchCardWidget(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
