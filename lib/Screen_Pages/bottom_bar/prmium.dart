import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/home.dart';
import 'package:pair_me/Screen_Pages/message.dart';
import 'package:pair_me/Screen_Pages/notification.dart';
import 'package:pair_me/Screen_Pages/premium_membership.dart';
import 'package:pair_me/Screen_Pages/setting.dart';
import 'package:pair_me/Widgets/bottom_navigation_bar.dart';

class primium extends StatefulWidget {
  const primium({super.key});

  @override
  State<primium> createState() => _primiumState();
}

class _primiumState extends State<primium> {
  int indexdata = 2;
  int selectedIndex = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
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
            PremiumMembership(),
            Setting_page(),
            Notification_page(),
          ],
          screenMange: indexdata),
    );
  }
}
