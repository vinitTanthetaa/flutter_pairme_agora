import 'dart:ui';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/show_users.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Screen_Pages/filter.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/swiper.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> with TickerProviderStateMixin {
  late TutorialCoachMark tutorialCoachMark;
  SharedPrefsService prefsService = SharedPrefsService();
  final GlobalKey _key = GlobalKey();
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  final GlobalKey _key4 = GlobalKey();
  final GlobalKey _key5 = GlobalKey();
  final GlobalKey _key6 = GlobalKey();

  GlobalKey _key7 = GlobalKey();
  int pageViewIndex = 0;
  final List _colors = [
    Colors.teal,
    Colors.green,
    Colors.greenAccent,
    Colors.white60,
    Colors.white60,
    Colors.white60,
  ];
  final AppinioSwiperController controller = AppinioSwiperController();
  List users = [
    {
      'Name': 'Jane Koblenz',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ0mv_NlCWaAPKCTefbXTZtdh3-d3CuK9GXA&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU'
      ]
    },
    {
      'Name': 'Larry Ellison',
      'images': [
        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwcm9maWxlLWxpa2VkfDE3fHx8ZW58MHx8fHx8&w=1000&q=80',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS92eisuWOx3tEjeW14mT9ACVgXDwIRBGtnww&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdX029ohIUSygq9zirl9fSNBwSLqEOaKEYuw&usqp=CAU'
      ]
    },
    {
      'Name': 'James Smith',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ0mv_NlCWaAPKCTefbXTZtdh3-d3CuK9GXA&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU'
      ]
    },
    {
      'Name': 'Michael Bloomberg',
      'images': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ0mv_NlCWaAPKCTefbXTZtdh3-d3CuK9GXA&usqp=CAU',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU'
      ]
    },
  ];
  bool exchang = false;
  Future<void> Show_case() async {
    showcase = (await prefsService.getBoolData('showcase'))!;
    if (showcase) {
      createTutorial();
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
     Show_case();
    //createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
    // controller.addListener(() {});
    // setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SafeArea(
              child: Column(
                children: [
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
                                        'assets/Images/pairme.png'))),
                          ),
                          InkWell(
                            onTap: () {
                              // setState(() {
                              //   exchang = !exchang;
                              // });
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Filter_page();
                                },
                              ));
                            },
                            child: Container(
                              //key: showcase ?_key : _key4,
                              key: _key,
                              height: screenHeight(context, dividedBy: 40),
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
                    height: screenHeight(context, dividedBy: 80),
                  ),
                  Expanded(
                      child: appinioSwip(
                          maxAngle: 0,
                          controller: controller,
                          onSwipe: _swipe,
                          onEnd: _onEnd,
                          cardsSpacing: screenHeight(context),
                          allowUnswipe: true,
                          onSwiping: (direction) {
                            print(direction.toString());
                          },
                          swipeOptions: const AppinioSwipeOptions.only(
                              top: true, bottom: true, left: true),
                          threshold: 100,
                          unswipe: (unswiped) {
                            print(unswiped);
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 100)),
                          cardsBuilder: (context, index) {
                            return Container(
                              // margin:EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 100)) ,
                              height: screenHeight(context),
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(users[index]['images']
                                          [pageViewIndex]),
                                      fit: BoxFit.fill),
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
                                      height:
                                          screenHeight(context, dividedBy: 3.5),
                                      width: screenWidth(context),
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                            Colors.black12,
                                            Colors.white10
                                          ])),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth(context,
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
                                                    width: screenWidth(context,
                                                        dividedBy: 2),
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          'Jane Koblenz',
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.symmetric(
                                                              horizontal:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          70)),
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 35),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 20),
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/Images/verified.png'))),
                                                        )
                                                      ],
                                                    )),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        SwipeablePageRoute(
                                                      builder: (context) {
                                                        return ShowUsers(
                                                          list: users[index]
                                                              ['images'],
                                                        );
                                                      },
                                                    ));
                                                  },
                                                  child: Container(
                                                    key: _key2,
                                                    height: screenHeight(
                                                        context,
                                                        dividedBy: 25),
                                                    width: screenWidth(context,
                                                        dividedBy: 15),
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/Images/side.png'))),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Text(
                                              'Entrepreneur',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'City/Country: ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Yorktown',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              children: [
                                                Text(
                                                  'Company: ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Infosys',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            const Text(
                                              'Startup founder',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Investor',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'Corporate executive',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: screenWidth(
                                                      context,
                                                      dividedBy: 7),
                                                  vertical: screenHeight(
                                                      context,
                                                      dividedBy: 55)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller.swipeUp();
                                                    },
                                                    child: Container(
                                                      key: _key4,
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 15),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 10),
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/Images/button1.png'))),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return Chatting_Page(
                                                            name: 'chatting',
                                                          );
                                                        },
                                                      ));
                                                      // controller.swipeUp();
                                                    },
                                                    child: Container(
                                                      key: _key5,
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 15),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 10),
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/Images/button2.png'))),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller.swipeDown();
                                                    },
                                                    child: Container(
                                                      key: _key6,
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 15),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 10),
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/Images/button3.png'))),
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
                                  // Align(
                                  //   alignment: Alignment.topLeft,
                                  //   child: Padding(
                                  //     padding: EdgeInsets.symmetric(
                                  //         horizontal: screenWidth(context,
                                  //             dividedBy: 20),
                                  //         vertical: screenHeight(context,
                                  //             dividedBy: 10)),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         SizedBox(
                                  //           // key: showcase ? _key2 : _key6,
                                  //           key: _key2,
                                  //           height: screenHeight(context,
                                  //               dividedBy: 3),
                                  //           width: screenHeight(context,
                                  //               dividedBy: 8),
                                  //         ),
                                  //         SizedBox(
                                  //
                                  //           height: screenHeight(context,
                                  //               dividedBy: 3),
                                  //           width: screenHeight(context,
                                  //               dividedBy: 8),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight(context,
                                              dividedBy: 9)),
                                      child: SizedBox(
                                        //  key: showcase ?_key3 :_key7,
                                        key: _key3,
                                        height:
                                            screenHeight(context, dividedBy: 3),
                                        width:
                                            screenHeight(context, dividedBy: 3),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          cardsCount: users.length)
                      // AppinioSwiper(
                      //   backgroundCardsCount: 2,
                      //   onSwipeCancelled: () {
                      //     print('cancel');
                      //   },
                      //   swipeOptions: const AppinioSwipeOptions.only(
                      //     top: true,
                      //     left: true,
                      //     bottom: true,
                      //   ),
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: screenWidth(context,dividedBy: 100)
                      //   ),
                      // //  direction: AppinioSwiperDirection.values.first,
                      //   duration: Duration.zero,
                      //   threshold: 1,
                      //   maxAngle: 0,
                      //   unlimitedUnswipe: true,
                      //   controller: controller,
                      //   unswipe: (unswiped) {
                      //     print("SUCCESS: card was unswiped");
                      //   },
                      //   onSwiping: (AppinioSwiperDirection direction) {
                      //     debugPrint(direction.toString());
                      //   },
                      //   onSwipe: _swipe,
                      //   onEnd: _onEnd,
                      //   cardsCount: 10,
                      //   cardsBuilder: (BuildContext context, int index) {
                      //     return       Container(
                      //       // margin:EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 100)) ,
                      //       height: screenHeight(context),
                      //       width: screenWidth(context),
                      //       decoration: BoxDecoration(
                      //           color: _colors[pageViewIndex],
                      //           borderRadius: BorderRadius.only(topRight: Radius.circular(23),topLeft: Radius.circular(23))
                      //       ),
                      //       child: Stack(
                      //         children: [
                      //           Align(
                      //             alignment: Alignment.topCenter,
                      //             child: Padding(
                      //               padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 35)),
                      //               child: TabPageSelector(
                      //                 controller: TabController(
                      //                     vsync: this,
                      //                     length: 6,
                      //                     initialIndex: pageViewIndex),
                      //                 color: AppColor.gray,
                      //                 borderStyle: BorderStyle.none,
                      //                 indicatorSize: 8,
                      //                 selectedColor: AppColor.skyBlue,
                      //               ),
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Expanded(
                      //                 child: InkWell(
                      //                   overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      //                   onTap: () {
                      //                     setState(() {
                      //                       pageViewIndex <= 5 && pageViewIndex > 0 ?pageViewIndex-- : null;
                      //                     });
                      //                   },
                      //                   child: Container(
                      //                     height: screenHeight(context),
                      //                   ),
                      //                 ),
                      //               ),
                      //               Expanded(
                      //                 child: InkWell(
                      //                   overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      //                   onTap: () {
                      //                     setState(() {
                      //                       pageViewIndex >= 5 && pageViewIndex < 6 ? null : pageViewIndex++;
                      //                     });
                      //                   },
                      //                   child: Container(
                      //                     height: screenHeight(context),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           Align(
                      //             alignment: Alignment.bottomCenter,
                      //             child: Container(
                      //               height: screenHeight(context,dividedBy: 3.5),
                      //               width: screenWidth(context),
                      //               decoration: const BoxDecoration(
                      //                   gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter
                      //                       ,colors: [Colors.transparent,Colors.black87])
                      //               ),
                      //               child: Padding(
                      //                 padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20)),
                      //                 child:  Column(
                      //                   crossAxisAlignment: CrossAxisAlignment.start,
                      //                   children: [
                      //                     Row(
                      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                       children: [
                      //                         Container(
                      //                             width: screenWidth(context,dividedBy: 2),
                      //                             child: Row(
                      //                               children: [
                      //                                 Text('Jane Koblenz',maxLines: 2,style: TextStyle(color: Colors.white,fontFamily: 'Roboto',fontSize: 25,fontWeight: FontWeight.w600),),
                      //                                 Container(
                      //                                   margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 70)),
                      //                                   height: screenHeight(context,dividedBy: 35),
                      //                                   width: screenWidth(context,dividedBy: 20),
                      //                                   decoration: BoxDecoration(
                      //                                       image: DecorationImage(image: AssetImage('assets/Images/verified.png'))
                      //                                   ),
                      //                                 )
                      //                               ],
                      //                             )),
                      //                         Container(
                      //                           height: screenHeight(context,dividedBy: 25),
                      //                           width: screenWidth(context,dividedBy: 15),
                      //                           decoration: BoxDecoration(
                      //                               image: DecorationImage(image: AssetImage('assets/Images/side.png'))
                      //                           ),
                      //                         )
                      //                       ],
                      //                     ),
                      //                     Text('Entrepreneur',style: TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Colors.white),),
                      //                     Row(
                      //                       children: [
                      //                         Text('City/Country: ',style: TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: Colors.white),),
                      //                         Text('Yorktown',style: TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Colors.white),),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Text('Company: ',style: TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: Colors.white),),
                      //                         Text('Infosys',style: TextStyle(fontSize: 12,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: Colors.white),),
                      //                       ],
                      //                     ),
                      //                     Padding(
                      //                       padding:  EdgeInsets.symmetric(
                      //                           horizontal: screenWidth(context,dividedBy: 7),
                      //                           vertical: screenHeight(context,dividedBy: 25)
                      //                       ),
                      //                       child: Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //
                      //                           Container(
                      //                             height: screenHeight(context,dividedBy: 15),
                      //                             width: screenWidth(context,dividedBy: 10),
                      //                             decoration: BoxDecoration(
                      //                                 image: DecorationImage(image: AssetImage('assets/Images/button1.png'))
                      //                             ),
                      //                           ),
                      //                           Container(
                      //                             height: screenHeight(context,dividedBy: 15),
                      //                             width: screenWidth(context,dividedBy: 10),
                      //                             decoration: BoxDecoration(
                      //                                 image: DecorationImage(image: AssetImage('assets/Images/button2.png'))
                      //                             ),
                      //                           ),
                      //                           Container(
                      //                             height: screenHeight(context,dividedBy: 15),
                      //                             width: screenWidth(context,dividedBy: 10),
                      //                             decoration: BoxDecoration(
                      //                                 image: DecorationImage(image: AssetImage('assets/Images/button3.png'))
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //     //   Container(
                      //     //   decoration: BoxDecoration(
                      //     //     borderRadius: BorderRadius.circular(10),
                      //     //     color: AppColor.white,
                      //     //     boxShadow: [
                      //     //       BoxShadow(
                      //     //         color: AppColor.gray,
                      //     //         spreadRadius: 3,
                      //     //         blurRadius: 7,
                      //     //         offset: const Offset(0, 3),
                      //     //       )
                      //     //     ],
                      //     //   ),
                      //     //   alignment: Alignment.center,
                      //     //   child: Column(
                      //     //     children: [
                      //     //       Flexible(
                      //     //         child: Container(
                      //     //           decoration: BoxDecoration(
                      //     //             gradient: candidates[index].color,
                      //     //             borderRadius: const BorderRadius.only(
                      //     //               topLeft: Radius.circular(10),
                      //     //               topRight: Radius.circular(10),
                      //     //             ),
                      //     //           ),
                      //     //         ),
                      //     //       ),
                      //     //       Container(
                      //     //         padding: const EdgeInsets.all(15),
                      //     //         decoration: const BoxDecoration(
                      //     //           color: Colors.white,
                      //     //           borderRadius: BorderRadius.only(
                      //     //             bottomLeft: Radius.circular(10),
                      //     //             bottomRight: Radius.circular(10),
                      //     //           ),
                      //     //         ),
                      //     //         child: Row(
                      //     //           children: [
                      //     //             Column(
                      //     //               mainAxisSize: MainAxisSize.min,
                      //     //               mainAxisAlignment: MainAxisAlignment.center,
                      //     //               crossAxisAlignment: CrossAxisAlignment.start,
                      //     //               children: [
                      //     //                 Text(
                      //     //                   candidates[index].name!,
                      //     //                   style: const TextStyle(
                      //     //                     color: Colors.black,
                      //     //                     fontWeight: FontWeight.bold,
                      //     //                     fontSize: 20,
                      //     //                   ),
                      //     //                 ),
                      //     //                 const SizedBox(
                      //     //                   height: 5,
                      //     //                 ),
                      //     //                 Text(
                      //     //                   candidates[index].job!,
                      //     //                   style: const TextStyle(
                      //     //                     color: Colors.grey,
                      //     //                     fontSize: 15,
                      //     //                   ),
                      //     //                 ),
                      //     //                 const SizedBox(
                      //     //                   height: 5,
                      //     //                 ),
                      //     //                 Text(
                      //     //                   candidates[index].city!,
                      //     //                   style: const TextStyle(
                      //     //                     color: Colors.grey,
                      //     //                     fontSize: 15,
                      //     //                   ),
                      //     //                 )
                      //     //               ],
                      //     //             ),
                      //     //           ],
                      //     //         ),
                      //     //       ),
                      //     //     ],
                      //     //   ),
                      //     // );
                      //   },
                      // )

                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    print("the card was swiped to the: $direction");
    if (direction.name == 'left') {
      Navigator.push(context, SwipeablePageRoute(
        builder: (context) {
          return ShowUsers(
            list: users[index - 1]['images'],
          );
        },
      ));
    }
  }

  void _onEnd() {
    print("end reached!");
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
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
        shape: ShapeLightFocus.RRect,
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
    targets.add(TargetFocus(
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
                    image: const AssetImage('assets/Images/SwipeUp-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context,dividedBy: 5),
                    width: screenHeight(context,dividedBy: 10),
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
      ),);
    targets.add(TargetFocus(
        identify: "swipe",
        keyTarget: _key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return    Column(
                children: [
                  Image(
                    image: const AssetImage('assets/Images/Swipe-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context,dividedBy: 5),
                    width: screenHeight(context,dividedBy: 10),
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
      ),);
    targets.add(TargetFocus(
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
                    image: const AssetImage('assets/Images/SwipeLeft-unscreen.gif'),
                    fit: BoxFit.cover,
                    height: screenHeight(context,dividedBy: 5),
                    width: screenHeight(context,dividedBy: 10),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        " Swipe Left to Show Users Full Details and her images or videos ",
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
      ),);
    targets.add(TargetFocus(
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
      ),);
    targets.add(TargetFocus(
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
      ),);
    targets.add(TargetFocus(
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
      ),);
    targets.add(TargetFocus(
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
      ),);
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
