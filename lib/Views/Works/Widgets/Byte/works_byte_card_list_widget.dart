import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Works/works_data_models.dart';
import 'package:todai_media_mobile/Views/Works/Widgets/Byte/works_card_byte_widget.dart';

class WorksByteCardListWidget extends StatelessWidget {
  final List<JobData> listData;
  final int dataInt;
  final String email;
  final bool isRondom, isLocation;
  WorksByteCardListWidget(
      {super.key,
      required this.listData,
      required this.dataInt,
      required this.email,
      this.isRondom = false,
      this.isLocation = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (isRondom) {
      listData.shuffle(Random());
    }
    return SizedBox(
      width: size.width,
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          final option = listData[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: WorksCardByteWidget(
              title: option.companyName,
              url: option.postUid,
              many: option.many,
              iconText: [
                WorksCardModel(
                  text: option.instruction,
                  icon: "assets/icons/hat.png",
                ),
                WorksCardModel(
                  text: option.location,
                  icon: "assets/icons/location.png",
                ),
                WorksCardModel(
                  text: option.clothing,
                  icon: "assets/icons/suit.png",
                ),
              ],
              email: email,
              imageURL: option.imageURL,
              allowedDomains: option.allowedDomains,
              location: isLocation ? option.station[0].schoolBuilding : "",
            ),
          );
        },
      ),
    );
  }
}
