import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSettingsItem(Icons.settings, 'アカウント', () {
            // アカウント設定画面への遷移
            print('アカウント設定へ遷移');
          }),
          _buildSettingsItem(Icons.list, '履歴', () {
            // アカウント設定画面への遷移
            print('履歴設定へ遷移');
          }),
          _buildSettingsItem(Icons.notifications_outlined, '通知', () {
            // 通知設定画面への遷移
            print('通知設定へ遷移');
          }),
          _buildSettingsItem(Icons.lock_outline, 'プライバシー', () {
            // プライバシー設定画面への遷移
            print('プライバシー設定へ遷移');
          }),
          // _buildSettingsItem(Icons.security_outlined, 'セキュリティ', () {
          //   // セキュリティ設定画面への遷移
          //   print('セキュリティ設定へ遷移');
          // }),
          _buildSettingsItem(Icons.support_outlined, 'ヘルプ', () {
            // ヘルプ画面への遷移
            print('ヘルプ画面へ遷移');
          }),
          _buildSettingsItem(Icons.info_outline, 'アプリ情報', () {
            // アプリ情報画面への遷移
            print('アプリ情報へ遷移');
          }),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
