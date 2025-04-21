import 'package:flutter/material.dart';
import 'package:todai_media_mobile/Views/Profile/profile_view.dart';
import 'package:todai_media_mobile/style.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        surfaceTintColor: white,
        title: Text(
          "設定",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ProfileView(),
    );
  }
}
