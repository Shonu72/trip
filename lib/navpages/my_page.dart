import 'package:flutter/material.dart';
import 'package:trip/widgets/app_text.dart';
import 'package:trip/widgets/setting_widgets.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.grey[200],
        //   // title: const AppText(
        //   //   text: "Profile",
        //   //   size: 24,
        //   //   color: Colors.black,
        //   // ),
        // ),
        body: SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/bike.png'),
              backgroundColor: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            const AppText(
              text: "John Doe",
              color: Colors.black,
              size: 30,
            ),
            const AppText(
              text: "@johndoe",
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(200, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () {},
              child: const Text("Edit Profile",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 10, endIndent: 10),
            const ProfileSettingWidget(
                text: "Settings", icon: Icons.settings_outlined),
            const ProfileSettingWidget(
                text: "My Trips", icon: Icons.place_outlined),
            const ProfileSettingWidget(
                text: "Orders", icon: Icons.menu_book_sharp),
            const ProfileSettingWidget(
                text: "Uocoming Trips", icon: Icons.local_florist_outlined),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 10, endIndent: 10),
            const ProfileSettingWidget(
                text: "Help & Support", icon: Icons.question_mark_outlined),
            const ProfileSettingWidget(
                text: "Logout", icon: Icons.logout_outlined),
          ],
        ),
      ),
    ));
  }
}
