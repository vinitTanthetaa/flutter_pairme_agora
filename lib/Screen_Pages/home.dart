import 'dart:ui';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/show_users.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Screen_Pages/filter.dart';
import 'package:pair_me/Screen_Pages/image_page.dart';
import 'package:pair_me/Screen_Pages/userDetails.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/Widgets/slidable_widget.dart';
import 'package:pair_me/Widgets/swiper.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:video_thumbnail_imageview/video_thumbnail_imageview.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {
  TabController? tabController;
  late TutorialCoachMark tutorialCoachMark;
  SharedPrefsService prefsService = SharedPrefsService();
  final GlobalKey _key = GlobalKey();
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  final GlobalKey _key4 = GlobalKey();
  final GlobalKey _key5 = GlobalKey();
  final GlobalKey _key6 = GlobalKey();
  int pageViewIndex = 0;
  final AppinioSwiperController controller = AppinioSwiperController();
  final TextEditingController _bio = TextEditingController();
  List users = [
    {
      'Name': 'Jane Koblenz',
      'images': [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1653505425983-a5c89ae5986a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8&w=1000&q=80',
        'https://images.unsplash.com/photo-1661635577898-4bd9049fe8f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&w=1000&q=80'
      ]
    },
    {
      'Name': 'Larry Ellison',
      'images': [
        'https://images.unsplash.com/photo-1594745561149-2211ca8c5d98?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHx8&w=1000&q=80',
        'https://images.unsplash.com/photo-1594744803086-b902dd06f88a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE0fHx8ZW58MHx8fHx8&w=1000&q=80',
        'https://images.unsplash.com/photo-1653762384105-e0c693636509?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE3fHx8ZW58MHx8fHx8&w=1000&q=80'
      ]
    },
    {
      'Name': 'James Smith',
      'images': [
        'https://louellareese.com/wp-content/uploads/2018/09/Louella-Reese-Fall-Weekend-Casual-2.jpg',
        'https://images.squarespace-cdn.com/content/v1/5bf4e70b5cfd79de099a3f2b/1559507245723-2Y26J95GALHDEOX37DIK/coffee-shop-senior-portraits_0002.jpg',
        'https://i.pinimg.com/1200x/ae/18/50/ae185049c32fc24c3a02f465b41e488a.jpg'
      ]
    },
    {
      'Name': 'Michael Bloomberg',
      'images': [
        'https://i.pinimg.com/1200x/9a/00/8e/9a008e0ae4b10ecab9c2d583e452a879.jpg',
        'https://images.unsplash.com/photo-1538576048537-3e17ed5b1792?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDl8fHxlbnwwfHx8fHw%3D&w=1000&q=80',
        'https://images.unsplash.com/photo-1507019403270-cca502add9f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHx8&w=1000&q=80'
      ]
    },
  ];
  List lookingFor = [
    'Investor',
    'Startup founder',
    'Corporate executive',
  ];
  List list = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTT1VsnxGw7Phf_Giwuc126WClsqRK5hEVzGF8-8b4fWtE-CTqwBkTf1cBfxbXepxe8aug&usqp=CAU',
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLWxpa2VkfDE3fHx8ZW58MHx8fHx8&w=1000&q=80',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX029ohIUSygq9zirl9fSNBwSLqEOaKEYuw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ0mv_NlCWaAPKCTefbXTZtdh3-d3CuK9GXA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    // 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  ];
  bool exchang = false;
  List _skills = [
    '',
    '',
    '',
  ];
  int ind = 0;

  @override
  void initState() {
    createTutorial();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    Future.delayed(Duration.zero, showTutorial);
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  // Navigator.push(context, SwipeablePageRoute(
  // builder: (context) {
  // return ShowUsers(
  // list: users[ind]['images'],
  // );
  // },
  // ));
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
              Background_Img(context),
              PageView(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        Header_Space(context),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 20)),
                          child: SizedBox(
                            height: screenHeight(context, dividedBy: 20),
                            width: screenWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: screenHeight(context, dividedBy: 30),
                                  width: screenWidth(context, dividedBy: 3.5),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/pairme.png'
                                              // 'assets/Images/MicrosoftTeams-image (1).png'
                                              ))),
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) {
                                    //     return Filter_page();
                                    //   },
                                    // ));
                                  },
                                  child: Container(
                                    //key: showcase ?_key : _key4,
                                    key: _key,
                                    height:
                                        screenHeight(context, dividedBy: 40),
                                    width: screenHeight(context, dividedBy: 40),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Images/filter.png'))),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 100),
                        ),
                        Flexible(
                            child: AppinioSwiper(
                                controller: controller,
                                swipeOptions: const AppinioSwipeOptions.only(
                                  top: true,
                                  bottom: true,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenWidth(context, dividedBy: 100),
                                ),
                                cardsBuilder: (context, index) {
                                  ind = index;
                                  return Container(
                                    // margin:EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 100)) ,
                                    height: screenHeight(context),
                                    width: screenWidth(context),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(users[index]
                                              ['images'][pageViewIndex]),
                                          fit: BoxFit.cover,
                                          filterQuality: FilterQuality.high,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(23),
                                            topLeft: Radius.circular(23))),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: screenHeight(context,
                                                    dividedBy: 35)),
                                            child: TabPageSelector(
                                              // key:showcase ? _key1 :_key5,
                                              key: _key1,
                                              controller: TabController(
                                                  vsync: this,
                                                  length: 3,
                                                  initialIndex: pageViewIndex),
                                              color: AppColor.gray,
                                              borderStyle: BorderStyle.none,
                                              indicatorSize: 8,
                                              selectedColor: AppColor.skyBlue,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                onTap: () {
                                                  setState(() {
                                                    pageViewIndex <= 2 &&
                                                            pageViewIndex > 0
                                                        ? pageViewIndex--
                                                        : null;
                                                  });
                                                },
                                                child: Container(
                                                  height: screenHeight(context),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                overlayColor:
                                                    const MaterialStatePropertyAll(
                                                        Colors.transparent),
                                                onTap: () {
                                                  setState(() {
                                                    pageViewIndex >= 2 &&
                                                            pageViewIndex < 6
                                                        ? null
                                                        : pageViewIndex++;
                                                  });
                                                },
                                                child: Container(
                                                  height: screenHeight(context),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.7),
                                            width: screenWidth(context),
                                            decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ])),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth(
                                                      context,
                                                      dividedBy: 20)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: screenHeight(
                                                        context,
                                                        dividedBy: 100),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Jane Koblenz',
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .white,
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          100),
                                                            ),
                                                            Image(
                                                              image: AssetImage(
                                                                  "assets/Images/verified.png"),
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          45),
                                                              width:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          45),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                SwipeablePageRoute(
                                                              builder:
                                                                  (context) {
                                                                return ShowUsers(
                                                                  list: users[
                                                                          index]
                                                                      [
                                                                      'images'],
                                                                );
                                                              },
                                                            ));
                                                          },
                                                          child: Image(
                                                            image: AssetImage(
                                                                'assets/Images/side.png'),
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        25),
                                                            width: screenHeight(
                                                                context,
                                                                dividedBy: 25),
                                                          ))
                                                    ],
                                                  ),
                                                  Text(
                                                    'Entrepreneur',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'City/Country: ',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        'Yorktown',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Company: ',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        'Infosys',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight(
                                                        context,
                                                        dividedBy: 100),
                                                  ),
                                                  _skills.length == 1
                                                      ? Row(
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: AppColor
                                                                          .white),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            150),
                                                                    horizontal: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            60)),
                                                                child: Text(
                                                                  'Startup founder',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : _skills.length == 2
                                                          ? Row(
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical: screenHeight(
                                                                            context,
                                                                            dividedBy:
                                                                                150),
                                                                        horizontal: screenWidth(
                                                                            context,
                                                                            dividedBy:
                                                                                60)),
                                                                    child: Text(
                                                                      'Startup founder',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          50),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical: screenHeight(
                                                                            context,
                                                                            dividedBy:
                                                                                150),
                                                                        horizontal: screenWidth(
                                                                            context,
                                                                            dividedBy:
                                                                                60)),
                                                                    child: Text(
                                                                      'Startup founder',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Row(
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical: screenHeight(
                                                                            context,
                                                                            dividedBy:
                                                                                200),
                                                                        horizontal: screenWidth(
                                                                            context,
                                                                            dividedBy:
                                                                                60)),
                                                                    child: Text(
                                                                      'Startup founder',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          50),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical: screenHeight(
                                                                            context,
                                                                            dividedBy:
                                                                                200),
                                                                        horizontal: screenWidth(
                                                                            context,
                                                                            dividedBy:
                                                                                60)),
                                                                    child: Text(
                                                                      'Startup founder',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          50),
                                                                ),
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: AppColor
                                                                              .white),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical: screenHeight(
                                                                            context,
                                                                            dividedBy:
                                                                                200),
                                                                        horizontal: screenWidth(
                                                                            context,
                                                                            dividedBy:
                                                                                60)),
                                                                    child: Text(
                                                                      'Startup founder',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        35)),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          key: _key4,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            gradient:
                                                                const LinearGradient(
                                                                    colors: [
                                                                  AppColor
                                                                      .skyBlue,
                                                                  AppColor
                                                                      .whiteskyBlue
                                                                ]),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            20),
                                                                vertical:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            150)),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  ind++;
                                                                });
                                                                controller
                                                                    .swipeUp();
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Image(
                                                                    color: AppColor
                                                                        .white,
                                                                    image: AssetImage(
                                                                        'assets/Images/button1.png'),
                                                                    height: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            80),
                                                                    width: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            80),
                                                                  ),
                                                                  SizedBox(
                                                                    width: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            100),
                                                                  ),
                                                                  Text(
                                                                    'Reject',
                                                                    style: TextStyle(
                                                                        color: AppColor
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          key: _key5,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            gradient:
                                                                const LinearGradient(
                                                                    colors: [
                                                                  AppColor
                                                                      .skyBlue,
                                                                  AppColor
                                                                      .whiteskyBlue
                                                                ]),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                vertical:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            150)),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                  builder:
                                                                      (context) {
                                                                    return Chatting_Page(
                                                                      name:
                                                                          'chatting',
                                                                    );
                                                                  },
                                                                ));
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Image(
                                                                    color: AppColor
                                                                        .white,
                                                                    image: AssetImage(
                                                                        'assets/Images/button2.png'),
                                                                    height: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            70),
                                                                    width: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            70),
                                                                  ),
                                                                  SizedBox(
                                                                    width: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            100),
                                                                  ),
                                                                  Text(
                                                                    'Chat',
                                                                    style: TextStyle(
                                                                        color: AppColor
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          key: _key6,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            gradient:
                                                                const LinearGradient(
                                                                    colors: [
                                                                  AppColor
                                                                      .skyBlue,
                                                                  AppColor
                                                                      .whiteskyBlue
                                                                ]),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.symmetric(
                                                                horizontal:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            20),
                                                                vertical:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            150)),
                                                            child: InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  ind++;
                                                                });
                                                                controller
                                                                    .swipeDown();
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Image(
                                                                    color: AppColor
                                                                        .white,
                                                                    image: AssetImage(
                                                                        'assets/Images/button3.png'),
                                                                    height: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            70),
                                                                    width: screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            70),
                                                                  ),
                                                                  SizedBox(
                                                                    width: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            100),
                                                                  ),
                                                                  Text(
                                                                    'Connect',
                                                                    style: TextStyle(
                                                                        color: AppColor
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Roboto'),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: screenHeight(context,
                                                    dividedBy: 9)),
                                            child: SizedBox(
                                              key: _key3,
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              width: screenHeight(context,
                                                  dividedBy: 3),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                cardsCount: users.length))
                      ],
                    ),
                  ),
                  UsersDetails(list: users[ind]['images'])
                ],
              )
            ],
          )),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: $direction");
    if (direction.name == 'left') {}
  }

  void _onEnd() {
    print("end reached!");
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  Future<void> createTutorial() async {
    showcase = await prefsService.getBoolData('showcase') ?? true;
    if (showcase == false) {
      setState(() {});
    } else {
      tutorialCoachMark = TutorialCoachMark(
        targets: _createTargets(),
        colorShadow: Colors.black12,
        textSkip: "SKIP",
        textStyleSkip: const TextStyle(
          fontFamily: 'Roboto',
          color: AppColor.white,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        paddingFocus: 10,
        opacityShadow: 0.5,
        imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        onFinish: () {
          print("finish");
          showcase = false;
          prefsService.setBoolData('showcase', showcase);
        },
        onClickTarget: (target) {
          print('onClickTarget: $target');
        },
        onClickTargetWithTapPosition: (target, tapDetails) {
          print("target: $target");
          print(
              "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
        },
        onClickOverlay: (target) {
          print('onClickOverlay: $target');
        },
        onSkip: () {
          print("skip");
          showcase = false;
          prefsService.setBoolData('showcase', showcase);
          return true;
        },
      );
    }
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation",
        keyTarget: _key,
        alignSkip: Alignment.topLeft,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Fillter users as your choice like Distance or gender or Country or State or City or Looking for that it",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "keyBottomNavigation1",
        keyTarget: _key1,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Tap to Left Side Show the previous image of this User",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Tap Right Side to Show the Next image of this User",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "swipe",
        keyTarget: _key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Image(
                    image:
                        const AssetImage('assets/Images/SwipeUp-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 10),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Swipe up to  Reject user",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "swipe",
        keyTarget: _key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Image(
                    image: const AssetImage('assets/Images/Swipe-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 10),
                  ),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        " Swipe Down to Connect user ",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "swipe",
        keyTarget: _key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Image(
                    image: const AssetImage(
                        'assets/Images/SwipeLeft-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 10),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        " Swipe Left to Show Users Full Details and images or videos ",
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "UsersDetails",
        keyTarget: _key2,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tap to Show User`s full information",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Buttons",
        keyTarget: _key4,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tap to reject User",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Buttons",
        keyTarget: _key5,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tap to Chat and communicat with user",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Buttons",
        keyTarget: _key6,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Tap to connect with this user",
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      color: AppColor.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    // targets.add(
    //   TargetFocus(
    //     identify: "Target 0",
    //     keyTarget: keyButton1,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.bottom,
    //         builder: (context, controller) {
    //           return const Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 "Titulo lorem ipsum",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                     fontSize: 20.0),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 10.0),
    //                 child: Text(
    //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
    // targets.add(
    //   TargetFocus(
    //     identify: "Target 1",
    //     keyTarget: keyButton,
    //     color: Colors.purple,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.bottom,
    //         builder: (context, controller) {
    //           return Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               const Text(
    //                 "Titulo lorem ipsum",
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   fontSize: 20.0,
    //                 ),
    //               ),
    //               const Padding(
    //                 padding: EdgeInsets.only(top: 10.0),
    //                 child: Text(
    //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               ),
    //               ElevatedButton(
    //                 onPressed: () {
    //                   controller.previous();
    //                 },
    //                 child: const Icon(Icons.chevron_left),
    //               ),
    //             ],
    //           );
    //         },
    //       )
    //     ],
    //     shape: ShapeLightFocus.RRect,
    //     radius: 5,
    //   ),
    // );
    // targets.add(
    //   TargetFocus(
    //     identify: "Target 2",
    //     keyTarget: keyButton4,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.left,
    //         child: const Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "Multiples content",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   fontSize: 20.0),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //               child: Text(
    //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //       TargetContent(
    //           align: ContentAlign.top,
    //           child: const Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 "Multiples content",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     color: Colors.white,
    //                     fontSize: 20.0),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(top: 10.0),
    //                 child: Text(
    //                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               )
    //             ],
    //           ))
    //     ],
    //     shape: ShapeLightFocus.RRect,
    //   ),
    // );
    // targets.add(TargetFocus(
    //   identify: "Target 3",
    //   keyTarget: keyButton5,
    //   contents: [
    //     TargetContent(
    //         align: ContentAlign.right,
    //         child: const Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "Title lorem ipsum",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   fontSize: 20.0),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 10.0),
    //               child: Text(
    //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //             )
    //           ],
    //         ))
    //   ],
    //   shape: ShapeLightFocus.RRect,
    // ));
    // targets.add(TargetFocus(
    //   identify: "Target 4",
    //   keyTarget: keyButton3,
    //   contents: [
    //     TargetContent(
    //       align: ContentAlign.top,
    //       child: Column(
    //         children: <Widget>[
    //           InkWell(
    //             onTap: () {
    //               tutorialCoachMark.previous();
    //             },
    //             child: Padding(
    //               padding: const EdgeInsets.all(10.0),
    //               child: Image.network(
    //                 "https://juststickers.in/wp-content/uploads/2019/01/flutter.png",
    //                 height: 200,
    //               ),
    //             ),
    //           ),
    //           const Padding(
    //             padding: EdgeInsets.only(bottom: 20.0),
    //             child: Text(
    //               "Image Load network",
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 20.0),
    //             ),
    //           ),
    //           const Text(
    //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    //   shape: ShapeLightFocus.Circle,
    // ));
    // targets.add(
    //   TargetFocus(
    //     identify: "Target 5",
    //     keyTarget: keyButton2,
    //     shape: ShapeLightFocus.Circle,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.top,
    //         child: const Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: <Widget>[
    //             Padding(
    //               padding: EdgeInsets.only(bottom: 20.0),
    //               child: Text(
    //                 "Multiples contents",
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20.0),
    //               ),
    //             ),
    //             Text(
    //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           ],
    //         ),
    //       ),
    //       TargetContent(
    //           align: ContentAlign.bottom,
    //           child: const Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: <Widget>[
    //               Padding(
    //                 padding: EdgeInsets.only(bottom: 20.0),
    //                 child: Text(
    //                   "Multiples contents",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 20.0),
    //                 ),
    //               ),
    //               Text(
    //                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //             ],
    //           ))
    //     ],
    //   ),
    // );
    return targets;
  }
}
