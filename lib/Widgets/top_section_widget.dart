import 'package:flutter/material.dart';

class TopSectionWidget extends StatelessWidget {
  final String title, icon, mainImage;
  final searchWidget;
  final bool isWhiteColor;
  const TopSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.mainImage,
    this.searchWidget,
    this.isWhiteColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // タイトルテキスト表示
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        // レビューアイコン画像の表示（幅に応じてサイズ変更）
        Image.asset(icon, width: screenWidth > 400 ? 400 : screenWidth - 40),
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
          child: Image.asset(mainImage,
              width: screenWidth > 300 ? 300 : screenWidth),
        ),
        const SizedBox(height: 20),
        // 検索カードウィジェットを表示
        isWhiteColor
            ? Container(
                width: screenWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 225, 169),
                ),
                padding: EdgeInsets.all(10),
                child: searchWidget,
              )
            : searchWidget,

        const SizedBox(height: 50),
      ],
    );
  }
}
