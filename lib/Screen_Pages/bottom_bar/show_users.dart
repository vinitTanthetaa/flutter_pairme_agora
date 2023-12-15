import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/home.dart';
import 'package:pair_me/Screen_Pages/message.dart';
import 'package:pair_me/Screen_Pages/notification.dart';
import 'package:pair_me/Screen_Pages/profile.dart';
import 'package:pair_me/Screen_Pages/setting.dart';
import 'package:pair_me/Screen_Pages/userDetails.dart';
import 'package:pair_me/Widgets/bottom_navigation_bar.dart';

class ShowUsers extends StatefulWidget {
  List list;
  ShowUsers({super.key,required this.list});

  @override
  State<ShowUsers> createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  int indexdata = 0;
  int selectedIndex = 5;
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
          screenList: [
            UsersDetails(list: widget.list, onTap: () {
              print("nice");
            },),
            Message_page(),
            Profile_page(),
            Setting_page(),
            Notification_page(),
          ],
          screenMange: indexdata),
    );
  }
}
