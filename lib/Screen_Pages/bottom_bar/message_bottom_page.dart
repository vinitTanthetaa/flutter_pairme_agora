import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/home.dart';
import 'package:pair_me/Screen_Pages/message.dart';
import 'package:pair_me/Screen_Pages/notification.dart';
import 'package:pair_me/Screen_Pages/profile.dart';
import 'package:pair_me/Screen_Pages/setting.dart';
import 'package:pair_me/Widgets/bottom_navigation_bar.dart';

class Msg_bottom_page extends StatefulWidget {
  const Msg_bottom_page({super.key});

  @override
  State<Msg_bottom_page> createState() => _Msg_bottom_pageState();
}

class _Msg_bottom_pageState extends State<Msg_bottom_page> {
  int indexdata = 0;
  int selectedIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexdata = 1;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  bottomNavigationBarManage(
        selectedIndex: selectedIndex,
        bottomindex: indexdata,
        onTap: (index) {
          indexdata = index;
          selectedIndex = indexdata;
          setState(() {});
        },
      ),
      body: BottomNavBar(
          selectedIndex: selectedIndex,
          screenList: const [
            Home_Page(),
            Message_page(),
            Profile_page(),
            Setting_page(),
            Notification_page(),
          ],
          screenMange: indexdata),
    );
  }
}