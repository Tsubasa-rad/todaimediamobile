import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Review/Widgets/review_search_card_widget.dart';
import 'package:todai_media_mobile/Widgets/top_section_widget.dart';
import 'package:todai_media_mobile/Widgets/wave_painter.dart';
import 'package:todai_media_mobile/style.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    // スクロール可能なページ全体の構造を作成
    return CustomPaint(
      painter: WavePainter(color1: white, color2: base1Color), // 波形背景を描画
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopSectionWidget(
              title: "東大最大の授業口コミサイト",
              icon: "assets/icons/review.png",
              mainImage: "assets/images/reviews_top_image.png",
              searchWidget: ReviewSearchCardWidget(),
            ), // 上部セクションを表示
          ],
        ),
      ),
    );
  }
}
