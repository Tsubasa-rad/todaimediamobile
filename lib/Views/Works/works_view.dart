import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Works/byte_view.dart';
import 'package:todai_media_mobile/Views/Works/intern_view.dart';
import 'package:todai_media_mobile/style.dart';

class WorksView extends StatefulWidget {
  const WorksView({super.key});

  @override
  State<WorksView> createState() => _WorksViewState();
}

class _WorksViewState extends State<WorksView> {
  int _selectedIndex = 0; // 選択されたページのインデックスを保持

  final List<Widget> worksPage = [
    ByteView(),
    InternView(),
  ];

  void _onItemTapped(int index) {
    // ナビゲーションバーのアイテムがタップされたときにインデックスを更新
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // 画面サイズを取得
    return Column(
      children: [
        Row(
          children: [
            topTabBarWidget(size, "バイト", 0),
            topTabBarWidget(size, "インターン", 1),
          ],
        ),
        SizedBox(
          height: size.height - 190,
          child: worksPage[_selectedIndex],
        )
      ],
    );
  }

  GestureDetector topTabBarWidget(Size size, String title, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        width: size.width / 2,
        height: 40,
        decoration: _selectedIndex == index
            ? BoxDecoration(
                color: white,
                border: Border(
                    bottom: BorderSide(
                  color: worksBaseColor,
                  width: 4.0,
                )))
            : BoxDecoration(
                color: white,
              ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
