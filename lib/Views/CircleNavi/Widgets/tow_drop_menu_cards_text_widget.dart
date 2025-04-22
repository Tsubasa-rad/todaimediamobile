
import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/CicleNav/circle_navi_card_organization_model.dart';
import 'package:todai_media_mobile/style.dart';

class TowDropMenuCardsTextWidget extends StatefulWidget {
  // 選択中の値
  final String? selectedParent;
  final String? selectedChild;
  final onTap1, onTap2;
  final String text1, text2, text2Category;
  final String title, title2;
  final Color color;
  TowDropMenuCardsTextWidget({
    super.key,
    this.onTap1,
    this.onTap2,
    this.selectedParent,
    required this.selectedChild,
    required this.text1,
    required this.text2,
    required this.text2Category,
    required this.color,
    required this.title,
    required this.title2,
  });

  @override
  State<TowDropMenuCardsTextWidget> createState() =>
      _TowDropMenuCardsTextWidgetState();
}

class _TowDropMenuCardsTextWidgetState
    extends State<TowDropMenuCardsTextWidget> {
  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeWidth > 1040
              ? bigScreenDropDownCard(
                  widget.title,
                  widget.text1,
                  typeOrganizationModel.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  widget.onTap1,
                  widget.selectedParent,
                )
              : smallScreenDropDownCard(
                  widget.title,
                  widget.text1,
                  typeOrganizationModel.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  widget.onTap1,
                  widget.selectedParent,
                ),
          SizedBox(height: 20),
          sizeWidth > 1040
              ? Container(
                  width: 600,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title2,
                            style: TextStyle(
                              fontSize: 17,
                              color: widget.color,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 70),
                      SizedBox(
                        width: 280,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: widget.text2,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: widget.color),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: widget.color),
                            ),
                            labelStyle: TextStyle(color: widget.color),
                          ),
                          style: TextStyle(
                            fontSize: 17,
                            color: widget.color,
                          ),
                          items: widget.selectedParent != null
                              ? detailTypeOrganizationModel[
                                      widget.selectedParent!]!
                                  .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: SizedBox(
                                      width: 150,
                                      child: FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.scaleDown,
                                        child: Text(value),
                                      ),
                                    ),
                                  );
                                }).toList()
                              : [],
                          onChanged: widget.onTap2,
                          value: widget.selectedChild,
                          disabledHint: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.text2Category,
                              style: TextStyle(
                                fontSize: 17,
                                color: widget.color,
                              ),
                            ),
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
                      widget.title2,
                      style: TextStyle(
                        fontSize: 17,
                        color: widget.color,
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: widget.text2,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: widget.color),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: widget.color),
                        ),
                        labelStyle: TextStyle(color: widget.color),
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color: widget.color,
                      ),
                      items: widget.selectedParent != null
                          ? detailTypeOrganizationModel[widget.selectedParent!]!
                              .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: SizedBox(
                                  width: 150,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Text(value),
                                  ),
                                ),
                              );
                            }).toList()
                          : [],
                      onChanged: widget.onTap2,
                      value: widget.selectedChild,
                      disabledHint: sizeWidth >= 400
                          ? Text(
                              widget.text2,
                              style: TextStyle(
                                fontSize: 15,
                                color: widget.color,
                              ),
                            )
                          : SizedBox(
                              width: 150,
                              child: Text(
                                widget.text2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: widget.color,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Column smallScreenDropDownCard(
    String title,
    String text,
    item,
    onChanged,
    value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "種別 ",
              style: TextStyle(
                fontSize: 17,
                color: widget.color,
              ),
            ),
            Text(
              "※ 必須",
              style: TextStyle(color: red),
            ),
          ],
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: text,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.color),
            ),
            labelStyle: TextStyle(color: widget.color),
          ),
          style: TextStyle(
            fontSize: 17,
            color: widget.color,
          ),
          items: item,
          onChanged: onChanged,
          value: value,
          disabledHint: Text(widget.text2Category),
        ),
      ],
    );
  }

  Container bigScreenDropDownCard(
      String title, String text, item, onChanged, value) {
    return Container(
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
                  color: widget.color,
                ),
              ),
              Text(
                "必須",
                style: TextStyle(color: red),
              )
            ],
          ),
          SizedBox(width: 70),
          SizedBox(
            width: 280,
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: text,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: widget.color),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: widget.color),
                ),
                labelStyle: TextStyle(color: widget.color),
              ),
              style: TextStyle(
                fontSize: 17,
                color: widget.color,
              ),
              items: item,
              onChanged: onChanged,
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
