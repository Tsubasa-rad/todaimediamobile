
import 'package:flutter/material.dart';
import 'package:todai_media_mobile/style.dart';

class DropMenuCardTextWidget<T> extends StatelessWidget {
  final title, dropText;
  final List<T> item;
  final ValueChanged<T?> onValueChanged;
  final Color color;
  final bool isRequired;
  T? selectedValue;
  final String Function(T) itemAsString; // T型からString型への変換関数

  DropMenuCardTextWidget({
    super.key,
    required this.title,
    required this.dropText,
    required this.item,
    required this.onValueChanged,
    required this.color,
    required this.itemAsString, // 変換関数を必須にする
    this.isRequired = false,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return sizeWidth > 1040
        ? Container(
            width: 600,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                // ... (他の部分は変更なし)
                SizedBox(
                  width: 280,
                  child: DropdownButtonFormField<T>(
                    value: selectedValue,
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
                    items: item.map((T value) {
                      return DropdownMenuItem<T>(
                        value: value,
                        child: SizedBox(
                          width: 150,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(itemAsString(value)), // 変換関数を使用
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (T? newValue) {
                      onValueChanged(newValue);
                    },
                  ),
                ),
              ],
            ),
          )
        : sizeWidth >= 280
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... (他の部分は変更なし)
                  DropdownButtonFormField<T>(
                    value: selectedValue,
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
                    items: item.map((T value) {
                      return DropdownMenuItem<T>(
                        value: value,
                        child: SizedBox(
                          width: sizeWidth >= 315 ? 200 : 150,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(itemAsString(value)), // 変換関数を使用
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (T? newValue) {
                      onValueChanged(newValue);
                    },
                  ),
                ],
              )
            : Text("画面大きくしてください");
  }
}