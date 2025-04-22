import 'package:todai_media_mobile/Models/Works/works_data_models.dart';

final String image =
    "https://firebasestorage.googleapis.com/v0/b/todaimedia28.firebasestorage.app/o/posts%2FIMG_4294%20(1).jpg?alt=media&token=36965e09-a22d-459e-8a46-e8227b5af7f4";
final List<JobData> todaiDemoData = [
  JobData(
    postUid: "1",
    companyName:
        "株式会社ABCasdfghjkjnbvsverveavaevawvawevavasdadsvdasvdvsdavsadvsdavsdvsdvasdadsvdasvdvsdavsadvsdavsdvsd",
    clothing: "カジュアルvasdadsvdasvdvsdavsadvsdavsdvsd",
    instruction: "指示内容vasdadsvdasvdvsdavsadvsdavsdvsdadsdasdasadsdadsasasascxzf",
    imageURL: image,
    many: "時給1200円vasdadsvdasvdvsdavsadvsdavsdvsd",
    location: "東京k魔dkf’ms’dfまdmslfmsdlfま；sd’mファ；sldfmsd",
    allowedDomains: [],
    station: [
      DetailModel(
        schoolBuilding: "本館",
        sLocation: "東京大学本郷キャンパス",
        station: "本郷三丁目駅",
        manyDetail: "10人以上",
        training: "あり",
      ),
    ],
  ),
  JobData(
    postUid: "1",
    companyName: "株式会社ABC",
    clothing: "私服",
    instruction: "指導方法は自由です。",
    imageURL: image,
    many: "10人",
    location: "東京大学本郷キャンパス",
    allowedDomains: ["g.ecc.u-tokyo.ac.jp"],
    station: [],
  ),
  JobData(
    postUid: "2",
    companyName: "株式会社XYZ",
    clothing: "制服",
    instruction: "マニュアルに従ってください。",
    imageURL: image,
    many: "5人",
    location: "東京大学駒場キャンパス",
    allowedDomains: [],
    station: [],
  ),

  // 他のデータも同様に追加
];
