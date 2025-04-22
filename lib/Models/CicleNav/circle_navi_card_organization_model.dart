List<String> typeOrganizationModel = [
  "文化系サークル",
  "運動系サークル",
  "学生団体",
  "体育会",
];
Map<String, List<String>> detailTypeOrganizationModel = {
  "文化系サークル": detailCulturalTypeOrganizationModel,
  "運動系サークル": detailExerciseTypeOrganizationModel,
  "学生団体": detailStudentTypeOrganizationModel,
  "体育会": detailAthleticTypeOrganizationModel,
};
List<String> detailCulturalTypeOrganizationModel = [
  "音楽",
  "映像",
  '演劇',
  'エンタメ・芸術・伝統文化',
  '広報・出版',
  'IT・プログラミング',
  '学術・ゼミ',
  '食',
  '写真',
  'ボードゲーム・TRPG・ゲーム研究',
  'ファッション・デザイン',
  'ボランティア・社会貢献',
  'その他文化系',
];
List<String> detailExerciseTypeOrganizationModel = [
  'サッカー・フットサル',
  '野球・ソフトボール',
  'テニス・バドミントン',
  'アメフト・ラグビー',
  'ラクロス',
  '武道',
  'バスケ・バレー',
  'ダンス',
  '登山・キャンプ',
  '水上・水中スポーツ',
  '陸上競技',
  'ウィンタースポーツ',
  'ボウリング・ビリヤード・ダーツ',
  'その他スポーツ',
];
List<String> detailStudentTypeOrganizationModel = [
  'ビジネス系',
  '勉強系',
  'ボランティア系',
  '国際系',
];
List<String> detailAthleticTypeOrganizationModel = [
  'サッカー・フットサル',
  '野球・ソフトボール',
  'テニス・バドミントン',
  'アメフト・ラグビー',
  'ラクロス',
  '武道',
  'バスケ・バレー',
  'ダンス',
  '登山・キャンプ',
  '水上・水中スポーツ',
  '陸上競技',
  'ウィンタースポーツ',
  'ボウリング・ビリヤード・ダーツ',
  'その他スポーツ',
];
List<String> featuresOrganizationModel = [
  "兼部・兼サーOK",
  "30人以上",
  "60人以上",
  "通年メンバー募集",
  "二年生以上OK",
  "交流多め",
  "初心者OK",
];

List<String> mbtiModel = [
  'INTJ',
  'INTP',
  'ENTJ',
  'ENTP',
  'INFJ',
  'INFP',
  'ENFJ',
  'ENFP',
  'ISTJ',
  'ISFJ',
  'ESTJ',
  'ESFJ',
  'ISTP',
  'ISFP',
  'ESTP',
  'ESFP'
];
String mbtiText = """
INTJ（建築家 / Architect） - 戦略的で独立心が強く、計画的な完璧主義者
INTP（論理学者 / Logician） - 創造的で知的好奇心が強く、理論を探求する
ENTJ（指揮官 / Commander） - カリスマ的で決断力があり、リーダーシップに優れる
ENTP（討論者 / Debater） - 機知に富み、挑戦を楽しみ、新しいアイデアを生み出す
INFJ（提唱者 / Advocate） - 理想主義的で深い洞察力を持ち、他者のために行動する
INFP（仲介者 / Mediator） - 想像力豊かで感受性が高く、自分の価値観を大切にする
ENFJ（主人公 / Protagonist） - カリスマ的で人を引きつけ、周囲を導く力がある
ENFP（広報運動家 / Campaigner） - エネルギッシュで社交的、新しい可能性を追い求める
ISTJ（管理者 / Logistician） - 責任感が強く、実直で計画的に物事を進める
ISFJ（擁護者 / Defender） - 思いやりがあり、細やかな気配りができる実直な性格
ESTJ（幹部 / Executive） - 組織的でルールを重視し、効率的な行動を好む
ESFJ（領事 / Consul） - 社交的で親切、コミュニティを大切にする
ISTP（巨匠 / Virtuoso） - 実践的で柔軟、物事を自分で試して理解するのが得意
ISFP（冒険家 / Adventurer） - 芸術的で自由を求め、感受性が豊か
ESTP（起業家 / Entrepreneur） - エネルギッシュで大胆、スリルを求める
ESFP（エンターテイナー / Entertainer） - 明るく楽観的、周囲を盛り上げるのが得意
""";
