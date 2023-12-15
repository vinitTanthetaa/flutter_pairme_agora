import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:video_player/video_player.dart';
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
  final GlobalKey _key3 = GlobalKey();
  final GlobalKey _key4 = GlobalKey();
  final GlobalKey _key5 = GlobalKey();
  final GlobalKey _key6 = GlobalKey();
  final GlobalKey _key23 = GlobalKey();
  int pageViewIndex = 0;
  late AppinioSwiperController controller = AppinioSwiperController();
  final TextEditingController _bio = TextEditingController();
  List users = [
    {
      'Name': 'Virat Kohli',
      'images': [
        'https://wallpapers.com/images/hd/virat-kohli-hd-black-tuxedo-fibgrtdlqvatdblj.jpg',
        'https://i.pinimg.com/originals/e1/3e/c7/e13ec7f56eb99e1e1226137c8fd3c198.jpg',
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        //'https://files.oyebesmartest.com/uploads/large/virat-kohli-wallpaper-fulr32sd.jpg',
      ]
    },
    {
      'Name': 'Hardik Pande',
      'images': [
        'https://i.pinimg.com/originals/2e/31/a4/2e31a4fce6c52a98d518053d269d7eba.jpg',
        'https://w0.peakpx.com/wallpaper/380/775/HD-wallpaper-cricket-player-hardik-pandya-indian-cricketer.jpg',
        'https://m.timesofindia.com/photo/98910356/98910356.jpg',
      ]
    },
    {
      'Name': 'Amitabh Bachchan',
      'images': [
        'https://e1.pxfuel.com/desktop-wallpaper/85/759/desktop-wallpaper-%E2%9C%85-8-amitabh-bachchan-amitabh-bachchan-thumbnail.jpg',
        'https://c4.wallpaperflare.com/wallpaper/439/757/292/5bd141c33ba4a-wallpaper-preview.jpg',
        'https://c4.wallpaperflare.com/wallpaper/170/960/966/amitabh-bachchan-dashing-photoshoot-wallpaper-preview.jpg',
      ]
    },
    {
      'Name': 'Vincenzo Cassano',
      'images': [
        'https://e0.pxfuel.com/wallpapers/251/76/desktop-wallpaper-vincenzo-cassano-thumbnail.jpg',
        'https://i.pinimg.com/originals/9f/f8/fa/9ff8fa7d57de8a836f634716a85e56af.jpg',
        'https://assets.vogue.in/photos/62751a3c8cd4b91f5309d0d4/master/pass/Song%20Joong-ki.jpeg',
      ]
    },
    {
      'Name': 'Shahrukh khan',
      'images': [
        'https://e0.pxfuel.com/wallpapers/531/653/desktop-wallpaper-shah-rukh-khan-actor-king-gentleman-shahrukhkhan-attitude.jpg',
        'https://w0.peakpx.com/wallpaper/518/289/HD-wallpaper-shahrukh-khan-srk-smile-srk-smile-thumbnail.jpg',
        'https://www.filmibeat.com/wimgm/500x70/mobi/2019/08/shahrukh-khan_9.jpg',
      ]
    },
    {
      'Name': 'Robert Downey jr',
      'images': [
        'https://static.wikia.nocookie.net/ironman/images/7/79/Photo%28906%29.jpg/revision/latest?cb=20141019122536',
        'https://static.wikia.nocookie.net/bakerstreet/images/7/78/Robert_Downey_Jr._%282022%29.jpg/revision/latest?cb=20220526032213',
        'https://upnrm.in/wp-content/uploads/2022/08/ironman.webp',
      ]
    },
    {
      'Name': 'Johnny Depp',
      'images': [
        'https://images.saymedia-content.com/.image/t_share/MTc0NDI1MDExOTk2NTk5OTQy/top-10-greatest-johnny-depp-movies-of-all-time.jpg',
        'https://m.economictimes.com/thumb/msid-92536857,width-1200,height-900,resizemode-4,imgsize-62856/johnny-depp.jpg',
        'https://www.cultjer.com/img/ug_photo/2017_02/4061620170221075428.jpg',
      ]
    },
    {
      'Name': 'úrsula corberó',
      'images': [
        'https://www.bollywoodhungama.com/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-23-at-10.45.54-AM.jpeg',
        'https://cdn.7days.ru/upload/images/55d/bb61c45240d3f7d28c2a08a452b7a.jpg',
        'https://i.ytimg.com/vi/pIUiApJEAIg/oar2.jpg?sqp=-oaymwEYCJUDENAFSFqQAgHyq4qpAwcIARUAAIhC&rs=AOn4CLC71MqhrXj47zXDwMaIc2K4G7_HxQ',
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
  ];
  bool exchang = false;
  final List _skills = ['', ''];
  int ind = 0;
  bool swipeUp = false;
  bool swipeDown = false;
  late VideoPlayerController _controller;
  late PageController _pageController = PageController();
  @override
  void initState() {
    createTutorial();
    controller = AppinioSwiperController();
    // tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    Future.delayed(Duration.zero, showTutorial);
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
              Background_Img(context),
              PageView(
                controller: _pageController,
                scrollBehavior: MaterialScrollBehavior(),
                allowImplicitScrolling: true,
                onPageChanged: (value) {
                },
                physics: const ClampingScrollPhysics(),
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
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const Filter_page();
                                      },
                                    ));
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
                            child:
                            Stack(
                              children: [
                                AppinioSwiper(
                                    controller: controller,
                                    onCardPositionChanged: (position) {
                                      // print("position ==> ${position.offset.direction}");
                                      if(position.offset.direction > 0){
                                        setState(() {
                                          swipeDown = true;
                                          swipeUp = false;
                                        });
                                      }
                                      if(position.offset.direction < 0){
                                        setState(() {
                                          swipeUp = true;
                                          swipeDown = false;
                                        });
                                      }
                                    },

                                    onSwipeCancelled:(activity) {
                                      setState(() {
                                        swipeUp = false;
                                        swipeDown = false;
                                      });
                                    },
                                    onSwipeEnd: (previousIndex, targetIndex, activity) {
                                      setState(() {
                                        ind >= users.length-1 ? ind = ind : ind++;
                                      });
                                      setState(() {
                                        swipeUp = false;
                                        swipeDown = false;
                                      });
                                    },
                                    swipeOptions: const SwipeOptions.only(down: true,up: true) ,
                                    cardCount: users.length, cardBuilder: (BuildContext context, int index) {
                                      return  Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                          screenWidth(context, dividedBy: 100),
                                        ),
                                        child: Container(
                                          height: screenHeight(context),
                                          width: screenWidth(context),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(20))),
                                          child: Stack(
                                            children: [
                                              users[index]['images'][pageViewIndex].toString().endsWith(".mp4")?
                                              VideoWidget(videoUrl: users[index]['images'][pageViewIndex])
                                                  :  CachedNetworkImage(
                                                imageUrl: users[index]['images'][pageViewIndex],
                                                imageBuilder: (context, imageProvider) => Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                          filterQuality: FilterQuality.high
                                                      ),
                                                      borderRadius: const BorderRadius.only(
                                                          topRight: Radius.circular(20),
                                                          topLeft: Radius.circular(20))
                                                  ),
                                                ),
                                                placeholder: (context, url) => Container(
                                                  height: screenHeight(context),
                                                  width: screenWidth(context),
                                                  decoration: const BoxDecoration(
                                                      borderRadius: BorderRadius.only(
                                                          topRight: Radius.circular(20),
                                                          topLeft: Radius.circular(20)),
                                                    color: Colors.black
                                                  ),
                                                  child: const Center(
                                                    child: CircularProgressIndicator(color: AppColor.skyBlue,
                                                    ),
                                                  ),
                                                ),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: swipeUp == false &&
                                                    swipeDown == false
                                                    ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 35)),
                                                  child: TabPageSelector(
                                                    key: _key1,
                                                    controller: TabController(
                                                        vsync: this,
                                                        length: 3,
                                                        initialIndex:
                                                        pageViewIndex),
                                                    color: AppColor.gray,
                                                    borderStyle:
                                                    BorderStyle.none,
                                                    indicatorSize: 8,
                                                    selectedColor:
                                                    AppColor.skyBlue,
                                                  ),
                                                )
                                                    : const SizedBox(),
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
                                                      dividedBy: 3.9),
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
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: screenWidth(
                                                                  context,
                                                                  dividedBy: 1.3),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    users[index]
                                                                    ['Name'],
                                                                    style: const TextStyle(
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
                                                                    image: const AssetImage(
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
                                                            // GestureDetector(
                                                            //     onTap: () {
                                                            //       Navigator.push(
                                                            //           context,
                                                            //           SwipeablePageRoute(
                                                            //             builder:
                                                            //                 (context) {
                                                            //               return ShowUsers(
                                                            //                 list: users[
                                                            //                 index]
                                                            //                 [
                                                            //                 'images'],
                                                            //               );
                                                            //             },
                                                            //           ));
                                                            //     },
                                                            //     child: SizedBox(
                                                            //       key: _key23,
                                                            //       child: Image(
                                                            //         image: const AssetImage(
                                                            //             'assets/Images/side.png'),
                                                            //         height:
                                                            //         screenHeight(
                                                            //             context,
                                                            //             dividedBy:
                                                            //             25),
                                                            //         width: screenHeight(
                                                            //             context,
                                                            //             dividedBy: 25),
                                                            //       ),
                                                            //     ))
                                                          ],
                                                        ),
                                                        const Text(
                                                          'Entrepreneur',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily: 'Roboto',
                                                              fontWeight:
                                                              FontWeight.w400,
                                                              color: Colors.white),
                                                        ),
                                                        const Row(
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
                                                        const Row(
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
                                                                child:
                                                                const Text(
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
                                                                child:
                                                                const Text(
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
                                                                child:
                                                                const Text(
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
                                                                child:
                                                                const Text(
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
                                                                  60),
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
                                                                child:
                                                                const Text(
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
                                                                  60),
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
                                                                child:
                                                                const Text(
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
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: swipeDown
                                                    ? Alignment.bottomCenter
                                                    : Alignment.topCenter,
                                                child: swipeUp || swipeDown
                                                    ? Padding(
                                                  padding: EdgeInsets.only(
                                                    top: screenHeight(context,
                                                        dividedBy: 7),
                                                    bottom: screenHeight(
                                                        context,
                                                        dividedBy: 3.5),
                                                  ),
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 5,
                                                            color: AppColor.skyBlue
                                                            // color: swipeUp
                                                            //     ? Colors.red
                                                            //     : Color(0xff004FFF),
                                                          )),
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            screenWidth(
                                                                context,
                                                                dividedBy:
                                                                10),
                                                            vertical:
                                                            screenHeight(
                                                                context,
                                                                dividedBy:
                                                                70)),
                                                        child: Text(
                                                          swipeUp
                                                              ? "Skip"
                                                              : "Connect",
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              fontFamily:
                                                              'Roboto',
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              color: AppColor.skyBlue
                                                              // color: swipeUp
                                                              //     ? Colors.red
                                                              //     : Color(0xff004FFF)
                                                          ),
                                                        ),
                                                      )),
                                                )
                                                    : const SizedBox(),
                                              ),
                                              Align(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  key: _key3,
                                                  margin: EdgeInsets.only(top: screenHeight(context,dividedBy: 10)),
                                                  height: screenHeight(context,dividedBy: 9),
                                                  width: screenHeight(context,dividedBy: 9),

                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                },),
                                Align(
                                  alignment: swipeUp ? Alignment.bottomLeft : swipeDown ?Alignment.bottomRight :Alignment.bottomCenter ,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.symmetric(
                                        vertical: screenHeight(context, dividedBy: 70),
                                      horizontal: screenWidth(context,dividedBy: 15)
                                    ),
                                    child: swipeUp ?
                                    FadeIn(
                                      duration: const Duration(milliseconds: 1000),
                                      animate: true,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: screenHeight(context,dividedBy: 20),
                                        width: screenWidth(context,dividedBy: 3),
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              20),
                                            color: const Color(0xff6D9AFF)
                                          // gradient:
                                          // const LinearGradient(
                                          //     colors: [
                                          //       AppColor
                                          //           .skyBlue,
                                          //       AppColor
                                          //           .whiteskyBlue
                                          //     ]),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            // setState(() {
                                            //   ind++;
                                            // });
                                            controller
                                                .swipeUp();
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.close,color: AppColor.white,size: 25,),
                                              SizedBox(
                                                width: screenWidth(
                                                    context,
                                                    dividedBy:
                                                    200),
                                              ),
                                              const Text(
                                                'Skip',
                                                style: TextStyle(
                                                    color: AppColor
                                                        .white,
                                                    fontSize:
                                                    20,
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
                                    ) : swipeDown ?
                                    FadeIn(
                                      duration: Duration(milliseconds: 1000),
                                      animate: true,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: screenHeight(context,dividedBy: 20),
                                        width: screenWidth(context,dividedBy: 3),
                                        decoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              20),
                                            color: const Color(0xff6D9AFF)
                                          // gradient:
                                          // const LinearGradient(
                                          //     colors: [
                                          //       AppColor
                                          //           .skyBlue,
                                          //       AppColor
                                          //           .whiteskyBlue
                                          //     ]),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            // setState(() {
                                            //   ind++;
                                            // });
                                            controller
                                                .swipeUp();
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image(
                                                color: AppColor
                                                    .white,
                                                filterQuality: FilterQuality.high,

                                                image: const AssetImage(
                                                    'assets/Images/button3.png'),
                                                height: screenHeight(
                                                    context,
                                                    dividedBy:
                                                    45),
                                                width: screenHeight(
                                                    context,
                                                    dividedBy:
                                                    45),
                                              ),
                                              SizedBox(
                                                width: screenWidth(
                                                    context,
                                                    dividedBy:
                                                    100),
                                              ),
                                              const Text(
                                                'Connect',
                                                style: TextStyle(
                                                    color: AppColor
                                                        .white,
                                                    fontSize:
                                                    20,
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
                                    ) :
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceEvenly,
                                      children: [
                                        buttons(key: _key4, context: context, img: "assets/Images/button1.png", onTap: () {

                                            // setState(() {
                                            //   ind++;
                                            // });
                                            controller
                                                .swipeUp();

                                        }, buttonName: "Skip"),
                                        buttons(key: _key5, context: context, img: "assets/Images/button2.png", onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) {
                                                  return Chatting_Page(
                                                    name:
                                                    'chatting', Username: users[ind]
                                                  ['Name'], image: users[ind]['images'][pageViewIndex],
                                                  );
                                                },
                                              ));
                                        }, buttonName: "Chat"),
                                        buttons(key: _key6, context: context, img: "assets/Images/button3.png", onTap: () {

                                            // setState(() {
                                            //   ind++;
                                            // });
                                            controller
                                                .swipeDown();

                                        }, buttonName: "Connect"),
                                      ],
                                    ),
                                  )
                                )
                                // swipeUp ? Positioned(
                                //       bottom: screenHeight(context,dividedBy: 20),
                                //         left: screenWidth(context,dividedBy: 5),
                                //         child:   Center(
                                //           child: Image(image: const AssetImage('assets/Images/CloseShow.png'),
                                //             height: screenHeight(context,dividedBy: 10),
                                //             width: screenHeight(context,dividedBy: 10),
                                //             fit: BoxFit.fill,
                                //           ),
                                //         )
                                //     ) : swipeDown ?  Positioned(
                                //     bottom: screenHeight(context,dividedBy: 20),
                                //     right: screenWidth(context,dividedBy: 5),
                                //     child:   Image(image: const AssetImage('assets/Images/connectShow.png'),
                                //       height: screenHeight(context,dividedBy: 10),
                                //       width: screenHeight(context,dividedBy: 10),
                                //       fit: BoxFit.fill,
                                //     )) : const SizedBox()
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                   UsersDetails(list: users[ind]['images'], onTap: () {
                     _pageController.animateToPage(
                       0,
                       duration: Duration(milliseconds: 500),
                       curve: Curves.ease,
                     );
                   },)
                ],
              )
            ],
          )),
    );
  }



  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  Future<void> createTutorial() async {
    showcase = await prefsService.getBoolData('showcase') ?? true;
    showcasetime = await prefsService.getIntData("showcasetime") ?? 1;
    if (showcase) {
      if (showcasetime >= 3){

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
                    width: screenHeight(context, dividedBy: 5),
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
                    width: screenHeight(context, dividedBy: 5),
                  ),
                  const Card(
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
                    width: screenHeight(context, dividedBy: 5),
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
    // targets.add(
    //   TargetFocus(
    //     identify: "UsersDetails",
    //     keyTarget: _key23,
    //     alignSkip: Alignment.topRight,
    //     enableOverlayTab: true,
    //     shape: ShapeLightFocus.Circle,
    //     contents: [
    //       TargetContent(
    //         align: ContentAlign.left,
    //         builder: (context, controller) {
    //           return const Card(
    //             child: Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: Text(
    //                 "Tap to Show User`s full information",
    //                 maxLines: 2,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w600,
    //                   fontFamily: 'Roboto',
    //                   fontSize: 17,
    //                   color: AppColor.black,
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
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
    return targets;
  }
}
 Widget buttons ({required GlobalKey key,required BuildContext context,required String img,required Function() onTap,required String buttonName}){
  return  Container(
    key: key,
    decoration:
    BoxDecoration(
        borderRadius:
        BorderRadius
            .circular(
            20),
        color: const Color(0xff6D9AFF)
      // gradient:
      // const LinearGradient(
      //     colors: [
      //       AppColor
      //           .skyBlue,
      //       AppColor
      //           .whiteskyBlue
      //     ]),
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
        onTap: onTap,
        child: Row(
          children: [
            Image(
              color: AppColor
                  .white,
              image: AssetImage(
                  img),
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
                  90),
            ),
            Text(
              buttonName,
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
  );
 }

class VideoWidget extends StatefulWidget {
  final String videoUrl;

  const VideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.setVolume(10);
          _controller.play();
          _controller.setLooping(true); // Auto-repeating the video
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized ? ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20)
      ),
        child: VideoPlayer(_controller)) :
     Container(
       height: screenHeight(context),
       width: screenWidth(context),
       decoration: const BoxDecoration(
           borderRadius: BorderRadius.only(
               topRight: Radius.circular(20),
               topLeft: Radius.circular(20)),
           color: Colors.black
       ),
       child: Center(
         child: const CircularProgressIndicator(color: AppColor.skyBlue,
     ),
       ),
    );
  }
}
