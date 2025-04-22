import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Works/works_data_models.dart';
import 'package:todai_media_mobile/style.dart';

class WorksCardByteWidget extends StatefulWidget {
  final String title, url, many, imageURL;
  final String email;
  final List<WorksCardModel> iconText;
  final List<String> allowedDomains;
  final String location;
  WorksCardByteWidget({
    super.key,
    required this.title,
    required this.url,
    required this.many,
    required this.iconText,
    required this.imageURL,
    required this.email,
    required this.allowedDomains,
    this.location = "",
  });

  @override
  State<WorksCardByteWidget> createState() => _WorksCardByteWidgetState();
}

class _WorksCardByteWidgetState extends State<WorksCardByteWidget> {
  // ドメインチェック関数
  bool canAccess() {
    if (widget.email == null) return false;

    // allowedDomainsが空の場合もTrueを返す
    if (widget.allowedDomains.isEmpty) {
      return true;
    }

    // allowedDomainsにユーザーのドメインが含まれている場合はTrueを返す
    if (widget.allowedDomains.contains(widget.email.split('@').last)) {
      return true;
    }
    if (widget.email == "t8922781@gmail.com") {
      return true;
    }

    // それ以外の場合はFalseを返す
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 290,
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: black, width: 1),
          color: white,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(color: grey),
                    child: CachedNetworkImage(
                      imageUrl: widget.imageURL,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fitHeight,
                      height: 150,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 5),
                      worksDetailIconText(
                          widget.iconText[0].icon, widget.iconText[0].text),
                      worksDetailIconText(
                          widget.iconText[1].icon, widget.iconText[1].text),
                      worksDetailIconText(
                          widget.iconText[2].icon, widget.iconText[2].text),
                      SizedBox(height: 5),
                      Text(
                        canAccess() ? "￥ " + widget.many : "￥ ???????",
                        maxLines: 1,
                        style: TextStyle(
                          color: worksBaseColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (!canAccess())
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: white.withOpacity(0.7),
                ),
              ),
            if (!canAccess())
              Center(
                  child: Container(
                width: 200,
                height: 170,
                decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1),
                  color: white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      widget.allowedDomains.contains("g.ecc.u-tokyo.ac.jp")
                          ? "東大生限定案件です"
                          : "ログイン必須",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      "assets/icons/works.png",
                      width: 150,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 170,
                          decoration: BoxDecoration(
                            color: worksBaseColor,
                            borderRadius: BorderRadius.circular(35),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Spacer(),
                              Text(
                                "東大生認証はこちら",
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right_sharp,
                                size: 20,
                                color: white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          ],
        ),
      ),
    );
  }

  Padding worksDetailIconText(String icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 25,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
