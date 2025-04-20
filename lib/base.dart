import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/CircleNavi/circle_navi_view.dart';
import 'package:todai_media_mobile/Views/Home/home_view.dart';
import 'package:todai_media_mobile/Views/Profile/profile_view.dart';
import 'package:todai_media_mobile/Views/Review/review_view.dart';
import 'package:todai_media_mobile/Views/Works/works_view.dart';
import 'package:todai_media_mobile/style.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<IconData> icons = [
    Icons.home,
    Icons.rate_review_outlined,
    Icons.assured_workload_outlined,
    Icons.person_pin_circle_outlined,
    Icons.person,
  ];

  final List<String> labels = [
    'ホーム',
    'Review',
    'Works',
    'CircleNavi',
    'プロフィール',
  ];

  final List<Widget> pages = [
    HomeView(),
    ReviewView(),
    WorksView(),
    CircleNaviView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double _iconSize = 28;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        title: Text("東大メディア"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.person_rounded),
            ),
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Drawerを開く処理
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: drawerWidget(context),
      body: pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 70,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // 背景バー
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 6, color: Colors.black12)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: List.generate(icons.length, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => _onItemTapped(index),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_selectedIndex != index)
                                  Icon(icons[index], color: black),
                                if (_selectedIndex != index)
                                  Text(labels[index],
                                      style: TextStyle(
                                          fontSize: 12, color: black)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              // 浮き出た選択アイコン
              Positioned(
                top: -20, // ← 上にはみ出す高さ
                left:
                    _selectedIndex != 0 ? size.width / 5 * _selectedIndex : 15,
                child: GestureDetector(
                  onTap: () => _onItemTapped(_selectedIndex),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    width: _iconSize * 2,
                    height: _iconSize * 2,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        icons[_selectedIndex],
                        size: _iconSize,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Drawer drawerWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 15),
          ListTile(
            title: Text(
              "ホーム",
              style: TextStyle(
                decoration:
                    _selectedIndex == 0 ? TextDecoration.underline : null,
                decorationColor: _selectedIndex == 0 ? worksBaseColor : null,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
              Navigator.pop(context); // ← ドロワーを閉じる
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "授業口コミサイト",
              style: TextStyle(
                decoration:
                    _selectedIndex == 1 ? TextDecoration.underline : null,
                decorationColor: _selectedIndex == 1 ? worksBaseColor : null,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "サークル紹介サイト",
              style: TextStyle(
                decoration:
                    _selectedIndex == 3 ? TextDecoration.underline : null,
                decorationColor: _selectedIndex == 3 ? worksBaseColor : null,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedIndex = 3;
              });
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              "塾・長期インターン求人",
              style: TextStyle(
                decoration:
                    _selectedIndex == 2 ? TextDecoration.underline : null,
                decorationColor: _selectedIndex == 2 ? worksBaseColor : null,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
