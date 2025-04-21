
import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Widget/option_tiem.dart';
import 'package:todai_media_mobile/style.dart';

class CheckBoxWidget extends StatefulWidget {
  final String title;
  final List<OptionItem> options;
  final bool isMultiple;
  final Map<String, List<String>> selectedOptions;
  final Function(List<String>) onSelectionChanged;
  final bool isAddReview;
  final Color color;
  final bool isRequired, isCircle;

  const CheckBoxWidget({
    super.key,
    required this.title,
    required this.options,
    required this.isMultiple,
    required this.selectedOptions,
    required this.onSelectionChanged,
    this.isAddReview = false,
    this.color = baseColor,
    this.isRequired = false,
    this.isCircle = false,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: widget.isAddReview ? 2 : 5),
      width: sizeWidth > 1040 ? 600 : sizeWidth * 0.8,
      // padding: EdgeInsets.symmetric(vertical: widget.isAddReview ? 2 : 5),
      child: sizeWidth >= 1040
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title + "　",
                      style: TextStyle(
                          fontSize: 17, color: widget.color),
                    ),
                    if (widget.isRequired)
                      Text(
                        "※必須",
                        style: TextStyle(color: red),
                      ),
                  ],
                ),
                SizedBox(width: 50),
                widget.isCircle
                    ? SizedBox(
                        width: sizeWidth > 1020 ? 430 : sizeWidth - 900,
                        child: Wrap(
                          spacing: widget.isAddReview ? 5 : 10.0,
                          runSpacing: 5.0,
                          children: widget.options.map((option) {
                            return SizedBox(width: 300,
                              child: _buildOption(option),
                            );
                          }).toList(),
                        ),
                      )
                    : SizedBox(
                        width: sizeWidth > 1020 ? 300 : sizeWidth - 900,
                        child: Wrap(
                          spacing: widget.isAddReview ? 2 : 5.0,
                          runSpacing: 5.0,
                          children: widget.options.map((option) {
                            return SizedBox(width: 140,
                              child: _buildOption(option),
                            );
                          }).toList(),
                        ),
                      )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 17, color: widget.color),
                ),
                if (widget.isRequired)
                  Text(
                    "※必須",
                    style: TextStyle(color: red),
                  ),
                SizedBox(height: 10),
                Wrap(
                  spacing: widget.isAddReview ? 5 : 10.0,
                  runSpacing: 5.0,
                  children: widget.options.map((option) {
                    return _buildOption(option);
                  }).toList(),
                ),
              ],
            ),
    );
  }

  Widget _buildOption(OptionItem option) {
    bool isSelected =
        widget.selectedOptions[widget.title]?.contains(option.text) ?? false;

    return GestureDetector(
      onTap: () {
        _handleSelection(isSelected, option);

        // ✅ 選択された項目を通知
        widget.onSelectionChanged(widget.selectedOptions[widget.title] ?? []);
      },
      child: widget.isAddReview
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: widget.color, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: isSelected
                    ? widget.color // 選択時の背景色
                    : white,
              ),
              child: Column(
                children: [
                  Text(
                    option.text,
                    style: TextStyle(
                        fontSize: 17, color: isSelected ? white : widget.color),
                  ),
                ],
              ),
            )
          : Container(
              width: 110,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: widget.color, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(isSelected
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  Expanded(
                    child: Center(
                      child: Text(
                        option.text,
                        style: TextStyle(
                            fontSize: 17, color: widget.color),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _handleSelection(bool isSelected, OptionItem option) {
    setState(() {
      if (widget.isMultiple) {
        if (isSelected) {
          // すでに選択されている場合は削除
          widget.selectedOptions[widget.title]
              ?.removeWhere((item) => item == option.text);
        } else {
          // 未選択の場合は追加
          widget.selectedOptions[widget.title]?.add(option.text);
        }
      } else {
        // 単一選択の場合
        if (isSelected) {
          // 既に選択されている場合はチェックを外す（クリア）
          widget.selectedOptions[widget.title]?.clear();
        } else {
          // 未選択の場合は他の選択肢をリセットしてから追加
          widget.selectedOptions[widget.title]?.clear();
          widget.selectedOptions[widget.title]?.add(option.text);
        }
      }
    });
  }
}