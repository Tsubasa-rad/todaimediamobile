import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/CircleNavi/Widgets/cicle_navi_serach_card_widget.dart';
import 'package:todai_media_mobile/Widgets/top_section_widget.dart';

class CircleNaviView extends StatelessWidget {
  const CircleNaviView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 255, 245, 226)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopSectionWidget(
              title: "東京大学のサークル検索サイト",
              icon: "assets/icons/Circle.png",
              mainImage: "assets/images/circle_navi_top_image.PNG",
              searchWidget: CicleNaviSerachCardWidget(),
              isWhiteColor: true,
            ),
          ],
        ),
      ),
    );
  }
}
