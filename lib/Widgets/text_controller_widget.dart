
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todai_media_mobile/style.dart';

class TextControllerWidget extends StatelessWidget {
  final String hintText, title;
  final TextEditingController controller;
  // ignore: prefer_typing_uninitialized_variables
  final onChanged;
  final Color color;
  final int lines;
  final bool isRequired, isNumber;
  const TextControllerWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.title,
    this.onChanged,
    required this.color,
    this.lines = 1,
    this.isRequired = false,
    this.isNumber = false,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        color: color,
                      ),
                    ),
                    if (isRequired)
                      Text(
                        "必須",
                        style: TextStyle(color: red),
                      )
                  ],
                ),
                SizedBox(width: 70),
                SizedBox(
                  width: 280,
                  child: TextFormField(
                    onChanged: onChanged,
                    controller: controller, // 引数で渡されたコントローラを使用
                    maxLines: lines, // これにより、改行が可能になります
                    keyboardType:
                        isNumber ? TextInputType.number : TextInputType.text,
                    inputFormatters: isNumber
                        ? [FilteringTextInputFormatter.digitsOnly] // 数字のみ許可
                        : [],
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: color),
                      filled: true,
                      fillColor: white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: color),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: color),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  color: color,
                ),
              ),
              if (isRequired)
                Text(
                  "必須",
                  style: TextStyle(color: red),
                ),
              SizedBox(height: 10),
              TextFormField(
                onChanged: onChanged,
                controller: controller, // 引数で渡されたコントローラを使用
                maxLines: lines,
                keyboardType:
                    isNumber ? TextInputType.number : TextInputType.text,
                inputFormatters: isNumber
                    ? [FilteringTextInputFormatter.digitsOnly] // 数字のみ許可
                    : [],
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: color),
                  filled: true,
                  fillColor: white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: color),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: color),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                ),
              ),
            ],
          );
  }
}
