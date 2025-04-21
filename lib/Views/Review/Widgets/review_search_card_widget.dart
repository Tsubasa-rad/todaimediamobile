import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Review/review_search_card_models.dart';
import 'package:todai_media_mobile/Models/Widget/option_tiem.dart';
import 'package:todai_media_mobile/Widgets/check_box_widget.dart';
import 'package:todai_media_mobile/Widgets/drop_menu_card_text_widget.dart';
import 'package:todai_media_mobile/Widgets/text_controller_widget.dart';
import 'package:todai_media_mobile/Widgets/time_drop_widget.dart';
import 'package:todai_media_mobile/style.dart';

class ReviewSearchCardWidget extends StatefulWidget {
  const ReviewSearchCardWidget({super.key});

  @override
  State<ReviewSearchCardWidget> createState() => _ReviewSearchCardWidgetState();
}

class _ReviewSearchCardWidgetState extends State<ReviewSearchCardWidget> {
  String? selectedOrganizationValue;
  String? selectedSeasonValue;
  String? selectedKEValue;
  String? selectedWeekValue;
  String? selectedTimeListValue;

  final TextEditingController _courseTextController = TextEditingController();
  final TextEditingController _supervisingTeacherController =
      TextEditingController();

  void onValueChanged(int index, String? newValue) {
    setState(() {
      selectedValues[index] = newValue; // 各インデックスに対応する値を更新
    });
  }

  void updateSelection(String category, List<String> selected) {
    setState(() {
      selectedOptions[category] = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    return Container(
      width: screenWidth - 20,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: black, // アウトラインの色
          width: 1.0, // アウトラインの太さ
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 570 ? 50 : 20, vertical: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "授業情報の検索",
                style: TextStyle(
                  fontSize: 20,
                  color: baseColor,
                ),
              ),
            ),
            Center(
              child: Text(
                "Seach for classes",
                style: TextStyle(
                  fontSize: 15,
                  color: baseColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            DropMenuCardTextWidget(
              title: "学部　　　",
              dropText: "学部を指定",
              item: profileOrganizationModel,
              onValueChanged: (newValue) {
                setState(() {
                  selectedOrganizationValue = newValue; // 選択された値を更新
                });
              },
              color: baseColor,
              itemAsString: (String value) => value,
            ),
            SizedBox(height: 5),
            DropMenuCardTextWidget(
              title: "開講時期　",
              dropText: "開講時期を指定",
              item: reviewsCardSeasonModel,
              onValueChanged: (newValue) {
                setState(() {
                  selectedSeasonValue = newValue.toString(); // 選択された値を更新
                });
              },
              color: baseColor,
              itemAsString: (reviewsSCModel review) => review.title,
            ),
            DropMenuCardTextWidget(
              title: "系列　　　",
              dropText: "系列を指定",
              item: reviewsCardKEModel,
              onValueChanged: (newValue) {
                setState(() {
                  selectedKEValue = newValue.toString(); // 選択された値を更新
                });
              },
              color: baseColor,
              itemAsString: (reviewsSCModel review) => review.title,
            ),
            CheckBoxWidget(
              title: "出席　　　",
              options: [
                OptionItem("着席必須"),
                OptionItem("出席パス"),
                OptionItem("なし"),
              ],
              isMultiple: false,
              onSelectionChanged: (selected) => updateSelection("出席", selected),
              selectedOptions: selectedOptions,
            ),
            CheckBoxWidget(
              title: "評価方法　",
              options: [
                OptionItem("レポート"),
                OptionItem("テスト"),
                OptionItem("小テスト"),
                OptionItem("発表"),
              ],
              isMultiple: true,
              onSelectionChanged: (selected) =>
                  updateSelection("評価方法", selected),
              selectedOptions: selectedOptions,
            ),
            TimeDropWidget(
              title: "曜日・時限",
              dropText: "曜日",
              dropText2: "時限",
              item: reviewsWeekModel,
              item2: reviewsTimeListModel,
              onValueChanged: (newValue) {
                setState(() {
                  selectedWeekValue = newValue.toString(); // 選択された値を更新
                });
              },
              color: baseColor,
              onValueChanged2: (newValue) {
                setState(() {
                  selectedTimeListValue = newValue.toString(); // 選択された値を更新
                });
              },
            ),
            SizedBox(height: 5),
            TextControllerWidget(
              hintText: "コース名",
              controller: _courseTextController,
              title: 'コース名　',
              color: baseColor,
            ),
            SizedBox(height: 5),
            TextControllerWidget(
              hintText: "担当教員名",
              controller: _supervisingTeacherController,
              title: '担当教員名',
              color: baseColor,
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: baseColor, // アウトラインの色
                  width: 1.0, // アウトラインの太さ
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 7),
                  Center(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: baseColor, // アウトラインの色
                          width: 1.0, // アウトラインの太さ
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: yellow,
                          ),
                          Text(
                            "口コミ評価で絞り込み",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: baseColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: List.generate(3, (index) {
                        return SizedBox(
                          width: 140,
                          child: DropdownButtonFormField<String>(
                            value: selectedValues[index], // 各ドロップダウンの初期値
                            decoration: InputDecoration(
                              labelText: dropTexts[index],
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: baseColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: baseColor),
                              ),
                              labelStyle: TextStyle(color: baseColor),
                            ),
                            style: TextStyle(
                              fontSize: 17,
                              color: baseColor,
                            ),
                            items: items.map((value) {
                              return DropdownMenuItem<String>(
                                value: value.text,
                                child: SizedBox(
                                  width: 90,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Text(value.title),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              onValueChanged(index, newValue);
                            },
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {},
              child: Container(
                width: 600,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "授業を検索する",
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
      ),
    );
  }
}
