
import 'package:flutter/material.dart';

class ManageDrawer extends StatelessWidget {
  const ManageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: [
          // ExpansionTile(
          //   title: const Text("SNS"),
          //   children: [
          //     snsButton(context, 'Instagram', instaURL),
          //     snsButton(context, 'LINE', line),
          //     snsButton(context, 'X/Twitter', xTwitter),
          //   ],
          // ),
          SizedBox(height: 15),
          ListTile(
            title: Text("TOP"),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            title: Text("授業口コミサイト"),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            title: Text("サークル紹介サイト"),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            title: Text("塾・長期インターン求人"),
            onTap: () {
            },
          ),
          Divider(),
          // listIconTile(
          //   () {
          //   },
          //   "assets/icons/worksIcon.png",
          //   "",
          // ),
          // ListTile(
          //   title: const Text('RECRUIT'),
          // onTap: () async {
          //   try {
          //     if (await canLaunchUrlString(
          //         "https://docs.google.com/forms/d/e/1FAIpQLSeuBd5YMbTQcKbG1IGJGtpVLm_pADUuSJ2TpptJcB1gmnj4pg/viewform")) {
          //       // ignore: deprecated_member_use
          //       await launch(
          //           "https://docs.google.com/forms/d/e/1FAIpQLSeuBd5YMbTQcKbG1IGJGtpVLm_pADUuSJ2TpptJcB1gmnj4pg/viewform",
          //           forceSafariVC: false);
          //     } else {
          //       throw 'このページは、開くことができませんでした';
          //     }
          //   } catch (e) {
          //     final snackBar = SnackBar(
          //       content: Text("申し訳ありませんがここへアクセスすることができませんでした。\n${e}"),
          //       backgroundColor: Colors.red,
          //     );
          //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //   }
          // },
          // ),
          // ListTile(
          //   title: const Text('CONTACT'),
            // onTap: () async {
            //   try {
            //     if (await canLaunchUrlString(
            //         "https://docs.google.com/forms/d/e/1FAIpQLSdLFYrsb3Y5L6BRfhycUPJyEAnTiVKI0whwUDleebm7Sc6k5g/viewform")) {
            //       // ignore: deprecated_member_use
            //       await launch(
            //           "https://docs.google.com/forms/d/e/1FAIpQLSdLFYrsb3Y5L6BRfhycUPJyEAnTiVKI0whwUDleebm7Sc6k5g/viewform",
            //           forceSafariVC: false);
            //     } else {
            //       throw 'このページは、開くことができませんでした';
            //     }
            //   } catch (e) {
            //     final snackBar = SnackBar(
            //       content: Text("申し訳ありませんがここへアクセスすることができませんでした。\n${e}"),
            //       backgroundColor: Colors.red,
            //     );
            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //   }
            // },
          // ),
        ],
      ),
    );
  }

  Padding listIconTile(onTap, String image, String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 250,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }

  ListTile snsButton(BuildContext context, String text, String url) {
    return ListTile(
      title: Text(text),
      onTap: () async {
        // try {
        //   if (await canLaunchUrlString(url)) {
        //     // ignore: deprecated_member_use
        //     await launch(url, forceSafariVC: false);
        //   } else {
        //     throw 'このページは、開くことができませんでした';
        //   }
        // } catch (e) {
        //   final snackBar = SnackBar(
        //     content: Text("申し訳ありませんがここへアクセスすることができませんでした。\n${e}"),
        //     backgroundColor: Colors.red,
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
      },
    );
  }
}
