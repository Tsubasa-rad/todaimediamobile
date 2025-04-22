import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Widget/option_tiem.dart';
import 'package:todai_media_mobile/Views/CircleNavi/Widgets/tow_drop_menu_cards_text_widget.dart';
import 'package:todai_media_mobile/Widgets/check_box_widget.dart';
import 'package:todai_media_mobile/Widgets/text_controller_widget.dart';
import 'package:todai_media_mobile/style.dart';

class CicleNaviSerachCardWidget extends StatefulWidget {
  const CicleNaviSerachCardWidget({super.key});

  @override
  State<CicleNaviSerachCardWidget> createState() => _CicleNaviSerachCardWidgetState();
}

class _CicleNaviSerachCardWidgetState extends State<CicleNaviSerachCardWidget> {
  String? _selectedParent;
  String? _selectedChild;

  final TextEditingController _circleNameTextController =
      TextEditingController();
  Map<String, List<String>> selectedOptions = {"形態　　　": [], "特徴　　　": []};

  void updateSelection(String category, List<String> selected) {
    setState(() {
      selectedOptions[category] = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final Color circleBaseColor = const Color.fromARGB(255, 255, 137, 1);

    return Container(
      width: screenWidth > 1040 ? 600 : screenWidth * 0.9,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: black, // アウトラインの色
          width: 1.0, // アウトラインの太さ
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 570 ? 50 : 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "サークル情報の検索",
            style: TextStyle(
              fontSize: 20,
              color: circleBaseColor,
            ),
          ),
          Text(
            "Seach for Circles ",
            style: TextStyle(
              fontSize: 15,
              color: circleBaseColor,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TowDropMenuCardsTextWidget(
              selectedChild: _selectedChild,
              selectedParent: _selectedParent,
              onTap1: (String? newValue) {
                setState(() {
                  _selectedParent = newValue;
                  _selectedChild = null; // 親が変わったら子の選択をリセット
                });
              },
              onTap2: (String? newValue) {
                setState(() {
                  _selectedChild = newValue;
                });
              },
              text1: '種別の指定',
              text2: '詳細種別の指定',
              text2Category: '種別を指定',
              color: base4Color,
              title: '種別　　　',
              title2: '詳細種別　',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckBoxWidget(
              isAddReview: true,
              title: "形態　　　",
              options: [
                OptionItem("インカレ"),
                OptionItem("東大のみ"),
              ],
              isMultiple: false,
              onSelectionChanged: (selected) =>
                  updateSelection("形態　　　", selected),
              selectedOptions: selectedOptions,
              color: base4Color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CheckBoxWidget(
              isAddReview: true,
              title: "特徴　　　",
              options: [
                OptionItem("兼部・兼サーOK"),
                OptionItem("二年生以上OK"),
                OptionItem("通年メンバー募集"),
                OptionItem("院生OK"),
              ],
              isMultiple: true,
              onSelectionChanged: (selected) =>
                  updateSelection("特徴　　　", selected),
              selectedOptions: selectedOptions,
              color: base4Color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextControllerWidget(
              hintText: "サークル名を指定（フリーワード）",
              controller: _circleNameTextController,
              title: 'サークル名',
              color: circleBaseColor,
            ),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () async {
            },
            child: Container(
              width: 600,
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "サークルを検索する",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
