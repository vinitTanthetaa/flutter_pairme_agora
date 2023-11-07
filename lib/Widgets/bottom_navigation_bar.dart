import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pair_me/helper/Size_page.dart';

class BottomNavBar extends StatefulWidget {
  List<Widget> screenList = [];
  int screenMange;
  int selectedIndex;

  BottomNavBar(
      {Key? key,
        required this.selectedIndex,
        required this.screenList,
        required this.screenMange,
       })
      : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int curIndex = 0;
  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );
    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
          () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: NavigationScreen(
          selectedIndex: widget.selectedIndex,
          index: widget.screenMange,
          screenList: widget.screenList,
        ));
  }
}

class NavigationScreen extends StatefulWidget {
  List<Widget> screenList = [];
  int selectedIndex;
  int index;
  NavigationScreen(
      {required this.index,
        required this.screenList,
        required this.selectedIndex});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex != 5) {
      if (widget.index == 0) {
        return widget.screenList[0];
      } else if (widget.index == 1) {
        return widget.screenList[1];
      } else if (widget.index == 2) {
        //defauilUrl = "https://www.google.com";
        return widget.screenList[2];
      } else if (widget.index == 3) {
        return widget.screenList[3];
      } else if (widget.index == 4) {
        return widget.screenList[4];
      }else{
        return Container(
          color: Colors.green,
        );
      }
    } else{
      return widget.screenList[0];
    }
  }
}

class bottomNavigationBarManage extends StatefulWidget {
  int bottomindex;
  int selectedIndex;
  bool? backGroundColor = false;
  Function(int) onTap;
  bottomNavigationBarManage(
      {Key? key,
        required this.onTap,
        required this.selectedIndex,
        required this.bottomindex,
        this.backGroundColor})
      : super(key: key);

  @override
  State<bottomNavigationBarManage> createState() =>
      _bottomNavigationBarManageState();
}

class _bottomNavigationBarManageState extends State<bottomNavigationBarManage> {
  List<String> bottomTabs = [
    "assets/Images/home.png",
    "assets/Images/msg.png",
    "assets/Images/person.png",
    "assets/Images/setting.png",
    "assets/Images/nitification.png"
  ];
  List<String> bottomGradientTabs = [
    'assets/Images/Shome.png',
    'assets/Images/Smsg.png',
    'assets/Images/Sperson.png',
    'assets/Images/Ssetting.png',
    'assets/Images/Snotification.png'
  ];


  //
  // List badgescolors = [
  //   Colors.transparent,
  //   Colors.red,
  //   Colors.transparent,
  //   Colors.transparent,
  // ];
  // List badgescolors1 = [
  //   Colors.transparent,
  //   Colors.black,
  //   Colors.transparent,
  //   Colors.transparent,
  // ];

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // messagnotiCubit = BlocProvider.of<MessagnotiCubit>(context);
    // messagnotiCubit.messages();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return
      AnimatedBottomNavigationBar.builder(
        itemCount: bottomTabs.length,
        height: screenHeight(context, dividedBy: 13),
        tabBuilder: (int index, bool isActive) {
          return Center(
            child: Container(
                height: screenHeight(context, dividedBy: 35),
                width: screenHeight(context, dividedBy: 35),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(isActive?bottomGradientTabs[index]:bottomTabs[index]))
                ),
            ),
          );
        },
        splashRadius: 2,
        backgroundColor: Colors.white,
        activeIndex: widget.bottomindex,
        splashColor: Colors.orange,
        gapLocation: GapLocation.none,
        splashSpeedInMilliseconds: 300,
        onTap: widget.onTap,
        // shadow:  BoxShadow(
        //   offset: Offset(0, 1),
        //   blurRadius: 5,
        //   spreadRadius: 0.5,
        //   co,
        // )
    );
  }
}