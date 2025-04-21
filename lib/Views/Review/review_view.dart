import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Review/Widgets/review_search_card_widget.dart';
import 'package:todai_media_mobile/Widgets/wave_painter.dart';
import 'package:todai_media_mobile/style.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;

    // スクロール可能なページ全体の構造を作成
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTopSection(screenWidth), // 上部セクションを表示
        ],
      ),
    );
  }

  // 上部の見出し・画像・検索カードなどを含むセクション
  Widget buildTopSection(double screenWidth) {
    return CustomPaint(
      painter: WavePainter(color1: white, color2: base1Color), // 波形背景を描画
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // タイトルテキスト表示
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text("東大最大の授業口コミサイト",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          // レビューアイコン画像の表示（幅に応じてサイズ変更）
          Image.asset("assets/icons/review.png",
              width: screenWidth > 400 ? 400 : screenWidth - 40),
          const SizedBox(height: 5),
          // 管理者情報とアイコンの表示
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("managed by ",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Image.asset("assets/icons/iconclrea.png", width: 30),
            ],
          ),
          // メインビジュアル画像の表示
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/reviews_top_image.png",
                width: screenWidth > 300 ? 300 : screenWidth),
          ),
          const SizedBox(height: 20),
          // 検索カードウィジェットを表示
          ReviewSearchCardWidget(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
