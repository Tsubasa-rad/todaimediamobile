Map<String, List<String>> selectedOptions = {
  "出席　　　": [],
  "評価方法　": [],
};
List<String?> selectedValues = [null, null, null]; // 各ドロップダウンの選択値
List<String> dropTexts = ["楽単さ", "面白さ", "得点期待"]; // 各ドロップダウンのラベル

final List<DropdownItem> items = [
  DropdownItem("3", "★3以上"),
  DropdownItem("4", "★4以上"),
  DropdownItem("5", "★5以上"),
];

class DropdownItem {
  final String text;
  final String title;
  DropdownItem(this.text, this.title);
}

List<reviewsSCModel> graduationYear = [
  reviewsSCModel("2022年卒", "2022年卒"),
  reviewsSCModel("2023年卒", "2023年卒"),
  reviewsSCModel("2024年卒", "2024年卒"),
  reviewsSCModel("2025年卒", "2025年卒"),
  reviewsSCModel("2026年卒", "2026年卒"),
  reviewsSCModel("2027年卒", "2027年卒"),
  reviewsSCModel("2028年卒", "2028年卒"),
  reviewsSCModel("2029年卒", "2029年卒"),
  reviewsSCModel("2030年卒", "2030年卒"),
  reviewsSCModel("2031年卒", "2031年卒"),
  reviewsSCModel("2032年卒", "2032年卒"),
];

List<String> profileOrganizationModel = [
  "前期教養学部",
  "後期教養学部",
  "法学部",
  "医学部",
  "工学部",
  "文学部",
  "理学部",
  "農学部",
  "経済学部",
  "教育学部",
  "薬学部",
  "法学政治学研究科",
  "医学系研究科",
  "工学系研究科",
  "人文社会系研究科",
  "理学系研究科",
  "農学生命科学研究科",
  "経済学研究科",
  "総合文化研究科",
  "教育学研究科",
  "薬学系研究科",
  "数理科学研究科",
  "新領域創成科学研究科",
  "情報理工学系研究科",
  "情報学環",
  "公共政策学教育部",
];
List<String> profileJobType = [
  '営業',
  'マーケティング',
  'システムエンジニア',
  'コンサルタント',
  '経理·法務',
  '為替ディーラー',
  '財務アドバイザー',
  '企画',
  '宣伝·広報',
  'ネットワークエンジニア',
  'デザイナー',
  '講師・インストラクター',
  '製造·開発·研究',
  '人事',
  '証券アナリスト',
  'Webデザイナー',
  '建築土木設計·施工管理',
  '店舗運営·販売·接客',
  '公務員',
  '教員',
  'その他',
  '未定、決まっていない',
];
List<String> profileDesiredIndustry = [
  'コンサル・シンクタンク',
  '金融',
  'メーカー',
  '商社',
  'IT・通信',
  '広告・マスコミ',
  '人材・教育',
  'インフラ・交通',
  '不動産・建設',
  '旅行・観光',
  'ブライダル・美容',
  '医療・福祉',
  '小売・流通',
  '公務員・団体職員',
  'その他',
];

List<reviewsSCModel> reviewsCardSeasonModel = [
  reviewsSCModel("S", "S"),
  reviewsSCModel("S1", "S1"),
  reviewsSCModel("S2", "S2"),
  reviewsSCModel("A", "A"),
  reviewsSCModel("A1", "A1"),
  reviewsSCModel("A2", "A2"),
  reviewsSCModel("W", "W"),
  reviewsSCModel("集中", "集中"),
  reviewsSCModel("通年", "通年"),
];

List<reviewsSCModel> reviewsCardKEModel = [
  reviewsSCModel("Ｌ（言語・コミュニケーション）", "L"),
  reviewsSCModel("Ａ（思想・芸術）", "A"),
  reviewsSCModel("Ｂ（国際・地域）", "B"),
  reviewsSCModel("Ｃ（社会・制度）", "C"),
  reviewsSCModel("Ｄ（人間・環境）", "D"),
  reviewsSCModel("Ｅ（物質・生命）", "E"),
  reviewsSCModel("Ｆ（数理・情報）", "F"),
  reviewsSCModel("選択なし", ""),
];

List<String> reviewsWeekModel = [
  "月曜",
  "火曜",
  "水曜",
  "木曜",
  "金曜",
  "土曜",
];

List<String> reviewsTimeListModel = [
  "1限",
  "2限",
  "3限",
  "4限",
  "5限",
  "6限",
];

class reviewsSCModel {
  String text, title;

  reviewsSCModel(
    this.title,
    this.text,
  );
}
