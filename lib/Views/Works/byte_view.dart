import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Models/Works/test_data.dart';
import 'package:todai_media_mobile/Models/Works/works_data_models.dart';
import 'package:todai_media_mobile/Views/Works/Widgets/Byte/works_byte_card_list_widget.dart';
import 'package:todai_media_mobile/style.dart';

class ByteView extends StatefulWidget {
  const ByteView({super.key});

  @override
  State<ByteView> createState() => _ByteViewState();
}

class _ByteViewState extends State<ByteView> {
  int _todaiDataValue = 3;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/byteSmart.png",
            fit: BoxFit.fitHeight,
          ),
          topWorksIntroductionCard(),
          TopWorksTitleTextWidget(
            title: "塾一覧　　-全3件-",
            sizeWith: size.width >= 930 ? 930 : size.width,
          ),
          _buildJobSection(
            title: "東大生限定オファー",
            jobs: todaiDemoData,
            shownCount: _todaiDataValue,
            width: size.width,
            onToggle: () {
              setState(() {
                _todaiDataValue =
                    _todaiDataValue == 3 ? todaiDemoData.length : 3;
              });
            },
            toggleLabel: _todaiDataValue == 3 ? "もっと見る" : "閉じる",
            emailDomain: "@todai.ac.jp",
          ),
        ],
      ),
    );
  }

  Widget _buildJobSection({
    required String title,
    required List<JobData> jobs,
    required int shownCount,
    required double width,
    required VoidCallback onToggle,
    required String toggleLabel,
    required String emailDomain,
  }) {
    return Container(
      width: width,
      // padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: width >= 930 ? 930 : width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: worksBaseColor,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 5),
              WorksByteCardListWidget(
                listData: jobs,
                dataInt: shownCount,
                email: emailDomain,
              ),
              SizedBox(height: 20),
              if (width >= 640) bottomButton(jobs, onToggle, toggleLabel),
            ],
          ),
        ),
      ),
    );
  }

  Center bottomButton(List<dynamic> data, onTap, String buttonText) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: worksBaseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(
                buttonText,
                style: TextStyle(color: white, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: white,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding topWorksIntroductionCard() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(color: white),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.end,
              spacing: 1,
              runSpacing: 1,
              children: [
                const Text(
                  "どこよりも",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                DottedTextOverlay(
                  text: "東大生に特化した",
                ),
                const Text(
                  "塾講師探しサイト",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset(
              "assets/icons/works.png",
              fit: BoxFit.fitHeight,
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("managed by ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Image.asset("assets/icons/iconclrea.png", width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopWorksTitleTextWidget extends StatefulWidget {
  final String title;
  final double sizeWith;
  final Color color, color2;
  const TopWorksTitleTextWidget({
    super.key,
    required this.title,
    required this.sizeWith,
    this.color = const Color.fromARGB(43, 64, 150, 248),
    this.color2 = worksBaseColor,
  });

  @override
  State<TopWorksTitleTextWidget> createState() =>
      _TopWorksTitleTextWidgetState();
}

class _TopWorksTitleTextWidgetState extends State<TopWorksTitleTextWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: widget.sizeWith,
        child: Container(
          // height: 50,
          color: widget.color,
          child: size.width >= 270
              ? Row(
                  children: [
                    Container(
                      height: 50,
                      width: 10,
                      color: widget.color2,
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      width: widget.sizeWith - 50,
                      child: Text(
                        widget.title,
                        maxLines: 3,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                )
              : SizedBox(
                  height: 50,
                  width: 10,
                  child: Text(
                    widget.title,
                    maxLines: 3,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
        ),
      ),
    );
  }
}

class DottedTextOverlay extends StatelessWidget {
  final String text;

  const DottedTextOverlay({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    const dot = '●';

    // 1文字ごとに分割
    final characters = text.characters.toList();

    return Wrap(
      spacing: 0, // 文字間隔に合わせる
      runSpacing: 1, // 行間スペース
      children: characters.map((char) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(dot, style: TextStyle(fontSize: 7, height: 1)),
            Text(
              char,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
