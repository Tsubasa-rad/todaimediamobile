import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Base/base_view_models.dart';
import 'package:todai_media_mobile/Views/Profile/profile_screen.dart';
import 'package:todai_media_mobile/style.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0; // 選択されたページのインデックスを保持

  void _onItemTapped(int index) {
    // ナビゲーションバーのアイテムがタップされたときにインデックスを更新
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // 画面サイズを取得
    double _iconSize = 28; // アイコンサイズを設定

    return Scaffold(
      appBar: appBarWidget(), // アプリバーを表示（外部関数）
      body: Stack(
        children: [
          SizedBox(
            height: size.height - 70, // 高さを画面の高さ - 70に設定
            child: basePages[_selectedIndex], // 現在のインデックスに応じたページを表示
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomNavigationBarWidget(
                size, _iconSize), // 下部ナビゲーションバーを表示（外部関数）
          )
        ],
      ),
    );
  }

// AppBar（上部バー）のウィジェットを返す関数
  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: white,
      surfaceTintColor: white,
      title: Image.asset(
        "assets/icons/${baseImages[_selectedIndex]}.png", // 選択中のアイコンを表示
        width: 200,
        height: 50,
        fit: BoxFit.fitHeight,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            // プロフィール画面へ遷移
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          icon: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.person_rounded), // 人型アイコン表示
          ),
        ),
      ],
    );
  }

// BottomNavigationBar（下部ナビゲーションバー）のウィジェットを返す関数
  Padding bottomNavigationBarWidget(Size size, double _iconSize) {
    final cardSize = size.width - 30; // ナビゲーションバーの幅
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: cardSize,
        height: 70,
        child: Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [BoxShadow(blurRadius: 6, color: Colors.black12)],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(baseIcons.length, (index) {
              return Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // 選択されていないときのアイコンとラベル表示
                    GestureDetector(
                      onTap: () => _onItemTapped(index), // タップでページ切り替え
                      child: SizedBox(
                        width: cardSize / 5,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (_selectedIndex != index)
                                Image.asset(
                                  "assets/barIcons/${baseImages[index]}_black.png",
                                  width: _iconSize,
                                ),
                              if (_selectedIndex != index)
                                Text(
                                  baseLabels[index],
                                  style: TextStyle(fontSize: 12, color: black),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 選択されているときの丸型アイコン表示（アニメ付き）
                    if (_selectedIndex == index)
                      Positioned(
                        top: -20,
                        left: (cardSize / baseIcons.length / 2) - (_iconSize),
                        child: GestureDetector(
                          onTap: () => _onItemTapped(_selectedIndex),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            width: _iconSize * 2,
                            height: _iconSize * 2,
                            decoration: BoxDecoration(
                              color: baseColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: baseColor.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/barIcons/${baseImages[_selectedIndex]}_white.png",
                                width: _iconSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
