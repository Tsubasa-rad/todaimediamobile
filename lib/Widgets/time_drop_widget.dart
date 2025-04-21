
import 'package:flutter/material.dart';
import 'package:todai_media_mobile/style.dart';
class TimeDropWidget extends StatelessWidget {
  // タイトル、2つのドロップダウン初期テキスト、選択肢リスト、色、選択時の処理を受け取る
  final title, dropText, dropText2;
  final List<String> item, item2;
  final Color color;

  final ValueChanged<String?> onValueChanged, onValueChanged2;

  const TimeDropWidget({
    super.key,
    required this.title,
    required this.dropText,
    required this.dropText2,
    required this.item,
    required this.item2,
    required this.onValueChanged,
    required this.onValueChanged2,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return sizeWidth > 1040
        // 横幅が1040px以上の場合：横並びレイアウトで表示
        ? Container(
            width: 600,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                // タイトル表示
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: baseColor,
                  ),
                ),
                SizedBox(width: 70),
                // 1つ目のドロップダウン
                SizedBox(
                  width: 130,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: dropText,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      labelStyle: TextStyle(color: color),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: color,
                    ),
                    items: item.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      onValueChanged(newValue); // 値選択時の処理
                    },
                  ),
                ),
                SizedBox(width: 20),
                // 2つ目のドロップダウン
                Container(
                  width: 130,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: dropText2,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      labelStyle: TextStyle(color: color),
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      color: color,
                    ),
                    items: item2.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      onValueChanged2(newValue); // 値選択時の処理
                    },
                  ),
                ),
              ],
            ),
          )
        // 横幅が1040px未満の場合：縦並びレイアウトで表示
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // タイトル表示
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  color: baseColor,
                ),
              ),
              SizedBox(height: 10),
              // 1つ目のドロップダウン
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: dropText,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  labelStyle: TextStyle(color: color),
                ),
                style: TextStyle(
                  fontSize: 17,
                  color: color,
                ),
                items: item.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  onValueChanged(newValue); // 値選択時の処理
                },
              ),
              SizedBox(height: 10),
              // 2つ目のドロップダウン
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: dropText2,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  labelStyle: TextStyle(color: color),
                ),
                style: TextStyle(
                  fontSize: 17,
                  color: color,
                ),
                items: item2.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  onValueChanged2(newValue); // 値選択時の処理
                },
              ),
            ],
          );
  }
}
