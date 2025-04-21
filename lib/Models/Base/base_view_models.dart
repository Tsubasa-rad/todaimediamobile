import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Articles/article_view.dart';
import 'package:todai_media_mobile/Views/CircleNavi/circle_navi_view.dart';
import 'package:todai_media_mobile/Views/Home/home_view.dart';
import 'package:todai_media_mobile/Views/Profile/profile_view.dart';
import 'package:todai_media_mobile/Views/Review/review_view.dart';
import 'package:todai_media_mobile/Views/Works/works_view.dart';

List<IconData> baseIcons = [
  Icons.home,
  Icons.chat,
  Icons.assured_workload_outlined,
  Icons.person_pin_circle_outlined,
  Icons.person,
];
List<String> baseImages = [
  "home",
  "article",
  "review",
  "Circle",
  "works",
];

final List<String> baseLabels = [
  'ホーム',
  '記事',
  'Review',
  'CircleNavi',
  'Works',
];

final List<Widget> basePages = [
  HomeView(),
  ArticleView(),
  ReviewView(),
  CircleNaviView(),
  WorksView(),
];
