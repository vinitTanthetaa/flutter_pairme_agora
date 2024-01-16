import 'package:animate_do/animate_do.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:pair_me/Modal/alluserprofile.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/home_screen.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Screen_Pages/filter.dart';
import 'package:pair_me/Screen_Pages/userDetails.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/cubits/connect_user.dart';
import 'package:pair_me/cubits/reject_user.dart';
import 'package:pair_me/cubits/show_all_users.dart';
import 'package:pair_me/cubits/undo_users_cubit.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:video_player/video_player.dart';

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
  String undoid = '';
  String bottonname = '';
  int pageViewIndex = 0;
  double height = 0;
  double height1 = 1.2;
  double fontsize = 70.0;
  double wight = 1;
  AllUsersDetailsCubit allUsersDetailsCubit = AllUsersDetailsCubit();
  AllUsersdetails allUsersdetails = AllUsersdetails();
  ConnectUserCubit connectUserCubit = ConnectUserCubit();
  RejectUserCubit rejectUserCubit = RejectUserCubit();
  UndoUsersCubit undoUsersCubit = UndoUsersCubit();
  late AppinioSwiperController controller = AppinioSwiperController();
  final TextEditingController bio = TextEditingController();
  AnimationController? _controller;
  List users = [
    {
      'Name': 'Virat Kohli',
      'images': [
        'https://wallpapers.com/images/hd/virat-kohli-hd-black-tuxedo-fibgrtdlqvatdblj.jpg',
        'https://i.pinimg.com/originals/e1/3e/c7/e13ec7f56eb99e1e1226137c8fd3c198.jpg',
        'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        //'https://files.oyebesmartest.com/uploads/large/virat-kohli-wallpaper-fulr32sd.jpg',
      ],
      'premium': 'assets/Images/premium.png'
    },
    {
      'Name': 'Hardik Pande',
      'images': [
        'https://i.pinimg.com/originals/2e/31/a4/2e31a4fce6c52a98d518053d269d7eba.jpg',
        'https://w0.peakpx.com/wallpaper/380/775/HD-wallpaper-cricket-player-hardik-pandya-indian-cricketer.jpg',
        'https://m.timesofindia.com/photo/98910356/98910356.jpg',
      ],
      'premium': 'assets/Images/premium1.png'
    },
    {
      'Name': 'Amitabh Bachchan',
      'images': [
        'https://e1.pxfuel.com/desktop-wallpaper/85/759/desktop-wallpaper-%E2%9C%85-8-amitabh-bachchan-amitabh-bachchan-thumbnail.jpg',
        'https://c4.wallpaperflare.com/wallpaper/439/757/292/5bd141c33ba4a-wallpaper-preview.jpg',
        'https://c4.wallpaperflare.com/wallpaper/170/960/966/amitabh-bachchan-dashing-photoshoot-wallpaper-preview.jpg',
      ],
      'premium': 'assets/Images/premium2.png'
    },
    {
      'Name': 'Vincenzo Cassano',
      'images': [
        'https://e0.pxfuel.com/wallpapers/251/76/desktop-wallpaper-vincenzo-cassano-thumbnail.jpg',
        'https://i.pinimg.com/originals/9f/f8/fa/9ff8fa7d57de8a836f634716a85e56af.jpg',
        'https://assets.vogue.in/photos/62751a3c8cd4b91f5309d0d4/master/pass/Song%20Joong-ki.jpeg',
      ],
      'premium': 'assets/Images/premium3.png'
    },
    {
      'Name': 'Shahrukh khan',
      'images': [
        'https://e0.pxfuel.com/wallpapers/531/653/desktop-wallpaper-shah-rukh-khan-actor-king-gentleman-shahrukhkhan-attitude.jpg',
        'https://w0.peakpx.com/wallpaper/518/289/HD-wallpaper-shahrukh-khan-srk-smile-srk-smile-thumbnail.jpg',
        'https://www.filmibeat.com/wimgm/500x70/mobi/2019/08/shahrukh-khan_9.jpg',
      ],
      'premium': 'assets/Images/premium.png'
    },
    {
      'Name': 'Robert Downey jr',
      'images': [
        'https://static.wikia.nocookie.net/ironman/images/7/79/Photo%28906%29.jpg/revision/latest?cb=20141019122536',
        'https://static.wikia.nocookie.net/bakerstreet/images/7/78/Robert_Downey_Jr._%282022%29.jpg/revision/latest?cb=20220526032213',
        'https://upnrm.in/wp-content/uploads/2022/08/ironman.webp',
      ],
      'premium': 'assets/Images/premium1.png'
    },
    {
      'Name': 'Johnny Depp',
      'images': [
        'https://images.saymedia-content.com/.image/t_share/MTc0NDI1MDExOTk2NTk5OTQy/top-10-greatest-johnny-depp-movies-of-all-time.jpg',
        'https://m.economictimes.com/thumb/msid-92536857,width-1200,height-900,resizemode-4,imgsize-62856/johnny-depp.jpg',
        'https://www.cultjer.com/img/ug_photo/2017_02/4061620170221075428.jpg',
      ],
      'premium': 'assets/Images/premium2.png'
    },
    {
      'Name': 'úrsula corberó',
      'images': [
        'https://www.bollywoodhungama.com/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-23-at-10.45.54-AM.jpeg',
        'https://cdn.7days.ru/upload/images/55d/bb61c45240d3f7d28c2a08a452b7a.jpg',
        'https://i.ytimg.com/vi/pIUiApJEAIg/oar2.jpg?sqp=-oaymwEYCJUDENAFSFqQAgHyq4qpAwcIARUAAIhC&rs=AOn4CLC71MqhrXj47zXDwMaIc2K4G7_HxQ',
      ],
      'premium': 'assets/Images/premium3.png'
    },
  ];
  List lookingFor = [
    'Investor',
    'Startup founder',
    'Startup founder',
    //  'Corporate executive',
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
  List image = [];
  bool exchang = false;
  int ind = 0;
  bool swipeUp = false;
  bool swipeDown = false;
  bool month = true;
  late final PageController _pageController = PageController();

  getData() async {
    allUsersdetails = (await allUsersDetailsCubit.GetAllUsersDetails())!;
    print(
        "==============================================>>${allUsersdetails.data?.first.length}");
    print(
        "==============================================>>${allUsersdetails.data?.length}");
    print(
        "==============================================>>${allUsersdetails.data?[0].length}");
    setState(() {});
  }

  getImage(int index) {
    if (allUsersdetails.data?[index].last.image != null) {
      if (allUsersdetails.data?[index].last.image?.photo1 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo1)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo1 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo1);
      }
      if (allUsersdetails.data?[index].last.image?.photo2 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo2)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo2 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo2);
      }
      if (allUsersdetails.data?[index].last.image?.photo3 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo3)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo3 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo3);
      }
      if (allUsersdetails.data?[index].last.image?.photo4 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo4)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo4 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo4);
      }
      if (allUsersdetails.data?[index].last.image?.photo5 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo5)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo5 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo5);
      }
      if (allUsersdetails.data?[index].last.image?.photo6 == null &&
          image.contains(allUsersdetails.data?[index].last.image?.photo6)) {
        image = image;
      } else if (allUsersdetails.data?[index].last.image?.photo6 != null) {
        image.add(allUsersdetails.data?[index].last.image?.photo6);
      }
    }
    image = image.toSet().toList();
  }

  @override
  void initState() {
    // allUsersDetailsCubit.GetAllUsersDetails();
    allUsersDetailsCubit = BlocProvider.of<AllUsersDetailsCubit>(context);
    rejectUserCubit = BlocProvider.of<RejectUserCubit>(context);
    connectUserCubit = BlocProvider.of<ConnectUserCubit>(context);
    undoUsersCubit = BlocProvider.of<UndoUsersCubit>(context);
    createTutorial();
    getData();
    _controller = AnimationController(vsync: this);
    controller = AppinioSwiperController();
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
                scrollBehavior: const MaterialScrollBehavior(),
                allowImplicitScrolling: true,
                onPageChanged: (value) {},
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
                                              'assets/Images/pairme.png'))),
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
                        BlocBuilder<AllUsersDetailsCubit, AllUsersDetailsState>(
                          builder: (context, state) {
                            if (state is AllUsersDetailsSuccess) {
                              return Expanded(
                                  child: Stack(
                                children: [
                                  AppinioSwiper(
                                    controller: controller,
                                    invertAngleOnBottomDrag: true,
                                    loop: true,
                                    onCardPositionChanged: (position) {
                                      if (position.offset.direction > 0) {
                                        setState(() {
                                          swipeDown = true;
                                          height = height + 20;
                                          swipeUp = false;
                                          bottonname = "Connect";
                                        });
                                      }
                                      if (position.offset.direction < 0) {
                                        setState(() {
                                          swipeUp = true;
                                          bottonname = "Reject";
                                          height1 = height1 >= 1.60
                                              ? height1 + 0.001
                                              : height1 + 0.004;
                                          height1 >= 1.50 && fontsize >= 20
                                              ? fontsize = fontsize - 1
                                              : fontsize = fontsize;
                                          wight = height1 >= 1.60
                                              ? wight + 0.001
                                              : wight + 0.003;
                                          // print("wight ===> $wight");
                                          height = height + 20;
                                          swipeDown = false;
                                        });
                                      }
                                    },
                                    onSwipeCancelled: (activity) {
                                      bottonname = '';
                                      setState(() {
                                        image.clear();
                                        swipeUp = false;
                                        swipeDown = false;
                                        fontsize = 70;
                                        height1 = 1.2;
                                        wight = 1;
                                        height = 0;
                                      });
                                    },
                                    onSwipeEnd:
                                        (previousIndex, targetIndex, activity) {
                                      setState(() {
                                        undoid = allUsersdetails
                                                .data?[ind].first.id ??
                                            '';
                                        print("undoid =======> $undoid");
                                        activity.direction == AxisDirection.up
                                            ? rejectUserCubit.GetRejectUser(
                                                id: allUsersdetails
                                                        .data?[ind].first.id ??
                                                    '')
                                            : connectUserCubit.GetConnectUser(
                                                id: allUsersdetails
                                                        .data?[ind].first.id ??
                                                    '');
                                        ind >= users.length - 1
                                            ? ind = ind
                                            : ind = targetIndex;
                                        height = 0;
                                        fontsize = 70;
                                        height1 = 1.2;
                                        wight = 1;
                                        swipeUp = false;
                                        swipeDown = false;
                                        image.clear();
                                        pageViewIndex = 0;
                                      });
                                    },
                                    threshold:
                                        screenHeight(context, dividedBy: 4.5),
                                    maxAngle:
                                        screenHeight(context, dividedBy: 7),
                                    swipeOptions: const SwipeOptions.only(
                                        down: true, up: true),
                                    cardCount:
                                        allUsersdetails.data?.length ?? 0,
                                    cardBuilder:
                                        (BuildContext context, int index) {
                                      getImage(index);
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth(context,
                                              dividedBy: 100),
                                        ),
                                        child: Container(
                                          // height: screenHeight(context),
                                          // width: screenWidth(context),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))
                                              // BorderRadius.only(
                                              //     topRight: Radius.circular(20),
                                              //     topLeft: Radius.circular(20)
                                              // )
                                              ),
                                          child: Stack(
                                            children: [
                                              swipeUp || swipeDown
                                                  ? Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: SizedBox(
                                                        child: Stack(
                                                          children: [
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  "${apis.baseurl}/${image[pageViewIndex]}",
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                height: screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        height1),
                                                                width: screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        wight),
                                                                decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        filterQuality:
                                                                            FilterQuality
                                                                                .high),
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .all(
                                                                            Radius.circular(20))),
                                                              ),
                                                              placeholder:
                                                                  (context,
                                                                          url) =>
                                                                      Container(
                                                                height:
                                                                    screenHeight(
                                                                        context),
                                                                width:
                                                                    screenWidth(
                                                                        context),
                                                                decoration: const BoxDecoration(
                                                                    borderRadius: BorderRadius.only(
                                                                        topRight:
                                                                            Radius.circular(
                                                                                20),
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                20)),
                                                                    color: Colors
                                                                        .black),
                                                                child:
                                                                    const Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: AppColor
                                                                        .skyBlue,
                                                                  ),
                                                                ),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                            ),
                                                            Container(
                                                                height: screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        height1),
                                                                width: screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        wight),
                                                                decoration: const BoxDecoration(
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment
                                                                            .bottomCenter,
                                                                        end: Alignment.topCenter,
                                                                        colors: [
                                                                          Colors
                                                                              .black,
                                                                          Colors
                                                                              .black38
                                                                        ]),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                child: swipeUp
                                                                    ? Center(
                                                                        child:
                                                                            Text(
                                                                          "Skip"
                                                                              .tr(),
                                                                          style: TextStyle(
                                                                              fontSize: fontsize,
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w700,
                                                                              // color: AppColor.skyBlue
                                                                              color: AppColor.white),
                                                                        ),
                                                                      )
                                                                    : Center(
                                                                        child:
                                                                            Text(
                                                                          "Connect"
                                                                              .tr(),
                                                                          style: TextStyle(
                                                                              fontSize: fontsize,
                                                                              fontFamily: 'Roboto',
                                                                              fontWeight: FontWeight.w700,
                                                                              // color: AppColor.skyBlue
                                                                              color: AppColor.white),
                                                                        ),
                                                                      )),
                                                          ],
                                                        ),
                                                      ))
                                                  : image[pageViewIndex]
                                                              .toString()
                                                              .endsWith(
                                                                  ".mp4") ||
                                                          image[pageViewIndex]
                                                              .toString()
                                                              .endsWith(".3gpp")
                                                      ? VideoWidget(
                                                          videoUrl:
                                                              "${apis.baseurl}/${image[pageViewIndex]}")
                                                      : CachedNetworkImage(
                                                          imageUrl:
                                                              "${apis.baseurl}/${image[pageViewIndex]}",
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    filterQuality:
                                                                        FilterQuality
                                                                            .high),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            20))),
                                                          ),
                                                          placeholder:
                                                              (context, url) =>
                                                                  Container(
                                                            height:
                                                                screenHeight(
                                                                    context),
                                                            width: screenWidth(
                                                                context),
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .black),
                                                            child: const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: AppColor
                                                                    .skyBlue,
                                                              ),
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              const Icon(
                                                                  Icons.error),
                                                        ),
                                              swipeUp || swipeDown
                                                  ? const SizedBox()
                                                  : Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: swipeUp == false &&
                                                              swipeDown == false
                                                          ? Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                  vertical: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          35)),
                                                              child:
                                                                  TabPageSelector(
                                                                key: _key1,
                                                                controller: TabController(
                                                                    vsync: this,
                                                                    length: image
                                                                        .length,
                                                                    initialIndex:
                                                                        pageViewIndex),
                                                                color: AppColor
                                                                    .gray,
                                                                borderStyle:
                                                                    BorderStyle
                                                                        .none,
                                                                indicatorSize:
                                                                    8,
                                                                selectedColor:
                                                                    AppColor
                                                                        .skyBlue,
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                    ),
                                              swipeUp || swipeDown
                                                  ? const SizedBox()
                                                  : Row(
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            overlayColor:
                                                                const MaterialStatePropertyAll(
                                                                    Colors
                                                                        .transparent),
                                                            onTap: () {
                                                              setState(() {
                                                                pageViewIndex <=
                                                                            2 &&
                                                                        pageViewIndex >
                                                                            0
                                                                    ? pageViewIndex--
                                                                    : null;
                                                                image = image;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                                  screenHeight(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            overlayColor:
                                                                const MaterialStatePropertyAll(
                                                                    Colors
                                                                        .transparent),
                                                            onTap: () {
                                                              setState(() {
                                                                pageViewIndex >=
                                                                        image.length -
                                                                            1
                                                                    ? null
                                                                    : pageViewIndex++;
                                                                print(
                                                                    pageViewIndex);
                                                                print(image
                                                                    .length);
                                                                image = image;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                                  screenHeight(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              swipeUp || swipeDown
                                                  ? const SizedBox()
                                                  : Align(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 4.1),
                                                        width: screenWidth(
                                                            context),
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20)),
                                                            gradient: LinearGradient(
                                                                begin: Alignment
                                                                    .topCenter,
                                                                end: Alignment
                                                                    .bottomCenter,
                                                                colors: [
                                                                  Colors
                                                                      .transparent,
                                                                  Colors.black
                                                                ])),
                                                        child: Padding(
                                                          padding: EdgeInsets.symmetric(
                                                              horizontal:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          20)),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  SizedBox(
                                                                    width: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            1.3),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          allUsersdetails.data?[index].first.name ??
                                                                              '',
                                                                          style: const TextStyle(
                                                                              color: AppColor.white,
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 25,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                        SizedBox(
                                                                          width: screenWidth(
                                                                              context,
                                                                              dividedBy: 100),
                                                                        ),
                                                                        Container(
                                                                          height: screenHeight(
                                                                              context,
                                                                              dividedBy: 45),
                                                                          width: screenHeight(
                                                                              context,
                                                                              dividedBy: 45),
                                                                          decoration:
                                                                              const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Images/verified.png"))),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Wrap(
                                                                    spacing: 7,
                                                                    direction: Axis
                                                                        .vertical,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Job Title'.tr(),
                                                                            style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          const Text(
                                                                            " : ",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          Text(
                                                                            13 >= allUsersdetails.data![index].first.professionalDetails!.addRole!.length
                                                                                ? "${allUsersdetails.data?[index].first.professionalDetails?.addRole ?? ''}"
                                                                                : "${allUsersdetails.data?[index].first.professionalDetails?.addRole?.substring(0, 13) ?? ''}...",
                                                                            style: const TextStyle(
                                                                                overflow: TextOverflow.ellipsis,
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'City/Country'.tr(),
                                                                            style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          const Text(
                                                                            " : ",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          Text(
                                                                            10 <= allUsersdetails.data![index].first.businessaddress!.country!.length
                                                                                ? "${allUsersdetails.data?[index].first.businessaddress?.country?.substring(0, 10) ?? ''}..."
                                                                                : "${allUsersdetails.data?[index].first.businessaddress?.country ?? ''}",
                                                                            style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Company'.tr(),
                                                                            style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          const Text(
                                                                            " : ",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white),
                                                                          ),
                                                                          Text(
                                                                            15 <= allUsersdetails.data![index].first.professionalDetails!.companyName!.length
                                                                                ? "${allUsersdetails.data?[index].first.professionalDetails?.companyName?.substring(0, 13) ?? ''}..."
                                                                                : "${allUsersdetails.data?[index].first.professionalDetails?.companyName ?? ''}",
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'Roboto',
                                                                                fontWeight: FontWeight.w400,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  Wrap(
                                                                    direction: Axis
                                                                        .vertical,
                                                                    spacing: 5,
                                                                    children: allUsersdetails
                                                                            .data?[index]
                                                                            .first
                                                                            .yourself
                                                                            ?.map((e) => Container(
                                                                                decoration: BoxDecoration(
                                                                                    border: Border.all(
                                                                                        color: AppColor.white
                                                                                        //const Color(0xff6D9Aff)
                                                                                        ,
                                                                                        width: 2),
                                                                                    borderRadius: BorderRadius.circular(20)),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.symmetric(
                                                                                    horizontal: screenWidth(context, dividedBy: 45),
                                                                                    vertical: screenHeight(context, dividedBy: 250),
                                                                                  ),
                                                                                  child: Text(
                                                                                    e,
                                                                                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12.7, fontFamily: 'Roboto', color: AppColor.white),
                                                                                  ),
                                                                                )))
                                                                            .toList() ??
                                                                        [],
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            100),
                                                              ),
                                                              const Spacer(),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                              swipeUp || swipeDown
                                                  ? Align(
                                                      alignment: swipeUp
                                                          ? Alignment
                                                              .bottomCenter
                                                          : Alignment.topCenter,
                                                      child: SizedBox(
                                                        height: height,
                                                      ),
                                                    )
                                                  : Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        key: _key3,
                                                        // margin: EdgeInsets.only(
                                                        //     top: screenHeight(context,
                                                        //         dividedBy: 10)),
                                                        height: 0,
                                                        width: 0,
                                                      ),
                                                    ),
                                              swipeUp || swipeDown
                                                  ? const SizedBox()
                                                  : Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: swipeUp == false &&
                                                              swipeDown == false
                                                          ? Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            120),
                                                                horizontal:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                              ),
                                                              child: Container(
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            17),
                                                                width:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            10),
                                                                // decoration: BoxDecoration(
                                                                //   color: Colors.red,
                                                                //     image: DecorationImage(
                                                                //         image: AssetImage(
                                                                //             users[index]
                                                                //             ['premium']),
                                                                //         fit: BoxFit
                                                                //             .cover,
                                                                //         filterQuality:
                                                                //         FilterQuality
                                                                //             .high)),
                                                                child: SvgPicture
                                                                    .asset(
                                                                        "assets/Images/premiumTag.svg"),
                                                              ))
                                                          : const SizedBox(),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    cardBuilder1:
                                        (BuildContext context, int index) {
                                      return image[pageViewIndex]
                                              .toString()
                                              .endsWith(".mp4")
                                          ? VideoWidget(
                                              videoUrl:
                                                  "${apis.baseurl}/${image[pageViewIndex]}")
                                          : CachedNetworkImage(
                                              imageUrl:
                                                  "${apis.baseurl}/${image[pageViewIndex]}",
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                        filterQuality:
                                                            FilterQuality.high),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                              ),
                                              placeholder: (context, url) =>
                                                  Container(
                                                height: screenHeight(context),
                                                width: screenWidth(context),
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color: Colors.black),
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColor.skyBlue,
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            );
                                    },
                                  ),
                                  Align(
                                      alignment: swipeUp
                                          ? Alignment.bottomLeft
                                          : swipeDown
                                              ? Alignment.bottomRight
                                              : Alignment.bottomCenter,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: screenHeight(context,
                                                  dividedBy: 70),
                                              horizontal: screenWidth(context,
                                                  dividedBy: 15)),
                                          child: swipeUp
                                              ? FadeIn(
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  animate: true,
                                                  child: buttons(
                                                      context: context,
                                                      img:
                                                          "assets/Images/button3.svg",
                                                      onTap: () {},
                                                      buttonName: "Skip",
                                                      bool: month),
                                                )
                                              : swipeDown
                                                  ? FadeIn(
                                                      duration: const Duration(
                                                          milliseconds: 1000),
                                                      animate: true,
                                                      child: buttons(
                                                          context: context,
                                                          img:
                                                              "assets/Images/button2.svg",
                                                          onTap: () {},
                                                          buttonName: "Connect",
                                                          bool: month),
                                                    )
                                                  : bottonname == "Connect"
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            buttons(
                                                                context:
                                                                    context,
                                                                img:
                                                                    "assets/Images/button3.svg",
                                                                onTap: () {
                                                                  rejectUserCubit.GetRejectUser(
                                                                          id: allUsersdetails.data?[ind].first.id ??
                                                                              '')
                                                                      .then(
                                                                    (value) {
                                                                      controller
                                                                          .swipeUp();
                                                                      setState(
                                                                          () {
                                                                        bottonname =
                                                                            "Reject";
                                                                      });
                                                                    },
                                                                  );
                                                                },
                                                                buttonName:
                                                                    "Skip",
                                                                bool: month),
                                                            buttons(
                                                                context:
                                                                    context,
                                                                img:
                                                                    "assets/Images/button1.svg",
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                    builder:
                                                                        (context) {
                                                                      return Chatting_Page(
                                                                        name:
                                                                            'chatting',
                                                                        Username:
                                                                            allUsersdetails.data?[ind].first.name ??
                                                                                '',
                                                                        image: allUsersdetails.data?[ind].first.profileImage ??
                                                                            '',
                                                                      );
                                                                    },
                                                                  ));
                                                                },
                                                                buttonName:
                                                                    "Chat",
                                                                bool: month),
                                                            buttons(
                                                                context:
                                                                    context,
                                                                img:
                                                                    "assets/Images/button4.svg",
                                                                onTap: () {
                                                                  undoUsersCubit
                                                                          .GetUndoUsers(
                                                                              id: undoid)
                                                                      .then(
                                                                    (value) async {
                                                                      setState(
                                                                          () {
                                                                        image =
                                                                            image;
                                                                      });
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                          return const Home_screen();
                                                                        },
                                                                      ));
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  );
                                                                },
                                                                buttonName:
                                                                    "Undo",
                                                                bool: month),
                                                          ],
                                                        )
                                                      : bottonname == "Reject"
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button4.svg",
                                                                    onTap: () {
                                                                      undoUsersCubit.GetUndoUsers(
                                                                              id: undoid)
                                                                          .then(
                                                                        (value) async {
                                                                          setState(
                                                                              () {
                                                                            image =
                                                                                image;
                                                                          });
                                                                          Navigator.pushReplacement(
                                                                              context,
                                                                              MaterialPageRoute(
                                                                            builder:
                                                                                (context) {
                                                                              return const Home_screen();
                                                                            },
                                                                          ));
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                      );
                                                                    },
                                                                    buttonName:
                                                                        "Undo",
                                                                    bool:
                                                                        month),
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button1.svg",
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                          return Chatting_Page(
                                                                            name:
                                                                                'chatting',
                                                                            Username:
                                                                                allUsersdetails.data?[ind].first.name ?? '',
                                                                            image:
                                                                                allUsersdetails.data?[ind].first.profileImage ?? '',
                                                                          );
                                                                        },
                                                                      ));
                                                                    },
                                                                    buttonName:
                                                                        "Chat",
                                                                    bool:
                                                                        month),
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button2.svg",
                                                                    onTap: () {
                                                                      connectUserCubit.GetConnectUser(
                                                                              id: allUsersdetails.data?[ind].first.id ?? '')
                                                                          .then(
                                                                        (value) {
                                                                          controller
                                                                              .swipeDown();
                                                                          setState(
                                                                              () {
                                                                            bottonname =
                                                                                "Connect";
                                                                          });
                                                                        },
                                                                      );
                                                                    },
                                                                    buttonName:
                                                                        "Connect",
                                                                    bool:
                                                                        month),
                                                              ],
                                                            )
                                                          : Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button3.svg",
                                                                    onTap: () {
                                                                      rejectUserCubit.GetRejectUser(
                                                                              id: allUsersdetails.data?[ind].first.id ?? '')
                                                                          .then(
                                                                        (value) {
                                                                          controller
                                                                              .swipeUp();
                                                                          setState(
                                                                              () {
                                                                            bottonname =
                                                                                "Reject";
                                                                          });
                                                                        },
                                                                      );
                                                                    },
                                                                    buttonName:
                                                                        "Skip",
                                                                    bool:
                                                                        month),
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button1.svg",
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                          return Chatting_Page(
                                                                            name:
                                                                                'chatting',
                                                                            Username:
                                                                                allUsersdetails.data?[ind].first.name ?? '',
                                                                            image:
                                                                                allUsersdetails.data?[ind].first.profileImage ?? '',
                                                                          );
                                                                        },
                                                                      ));
                                                                    },
                                                                    buttonName:
                                                                        "Chat",
                                                                    bool:
                                                                        month),
                                                                buttons(
                                                                    context:
                                                                        context,
                                                                    img:
                                                                        "assets/Images/button2.svg",
                                                                    onTap: () {
                                                                      connectUserCubit.GetConnectUser(
                                                                              id: allUsersdetails.data?[ind].first.id ?? '')
                                                                          .then(
                                                                        (value) {
                                                                          controller
                                                                              .swipeDown();
                                                                          setState(
                                                                              () {
                                                                            bottonname =
                                                                                "Connect";
                                                                          });
                                                                        },
                                                                      );
                                                                    },
                                                                    buttonName:
                                                                        "Connect",
                                                                    bool:
                                                                        month),
                                                              ],
                                                            )))
                                ],
                              ));
                            }
                            if (state is AllUsersDetailsLoading) {
                              return Expanded(
                                  child: Center(child: customLoader()));
                            }
                            if (state is AllUsersDetailsError) {
                              return Center(
                                child: Text("Somthing went wrong ...."),
                              );
                            }
                            return Center(
                              child: Text("Somthing went wrong ...."),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<AllUsersDetailsCubit, AllUsersDetailsState>(
                    builder: (context, state) {
                      if (state is AllUsersDetailsSuccess) {
                        return UsersDetails(
                          list: image,
                          onTap: () {
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          country: allUsersdetails
                                  .data?[ind].first.businessaddress?.country ??
                              '',
                          file1:
                              allUsersdetails.data?[ind].last.file?.file1 ?? '',
                          file3:
                              allUsersdetails.data?[ind].last.file?.file3 ?? '',
                          file2:
                              allUsersdetails.data?[ind].last.file?.file2 ?? '',
                          bio: allUsersdetails.data?[ind].last.bio ?? '',
                          Company: allUsersdetails.data?[ind].first
                                  .professionalDetails?.companyName ??
                              '',
                          looking_for:
                              allUsersdetails.data?[ind].last.lookingfor ?? [],
                          Name: allUsersdetails.data?[ind].first.name ?? '',
                          role: allUsersdetails.data?[ind].first
                                  .professionalDetails?.addRole ??
                              '',
                        );
                      }
                      if (state is AllUsersDetailsLoading) {
                        return customLoader();
                      }
                      if (state is AllUsersDetailsError) {
                        return Center(
                          child: Text("Somthing went wrong ...."),
                        );
                      }
                      return Center(
                        child: Text("Somthing went wrong ...."),
                      );
                    },
                  )
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
      if (showcasetime >= 3) {
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
          paddingFocus: 0,
          // opacityShadow: 0.5,
          // imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
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
        unFocusAnimationDuration: Duration.zero,
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
        // unFocusAnimationDuration: Duration.zero,
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
                        "Tap left or right to see different images",
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
        keyTarget: _key3,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        paddingFocus: 0.0,
        // focusAnimationDuration: Duration.zero,
        borderSide: BorderSide.none,
        unFocusAnimationDuration: Duration.zero,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Lottie.asset(
                    'assets/json/Swipe To Left.json',
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 5),
                    controller: _controller,
                    onLoaded: (composition) {
                      // Configure the AnimationController with the duration of the
                      // Lottie file and start the animation.
                      _controller
                        ?..duration = composition.duration
                        ..forward();
                    },
                  ),
                  // Image(
                  //   image:
                  //       const AssetImage('assets/Images/SwipeUp-unscreen.gif'),
                  //   fit: BoxFit.cover,
                  //   height: screenHeight(context, dividedBy: 5),
                  //   width: screenHeight(context, dividedBy: 5),
                  // ),
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
        paddingFocus: 0.0,
        // focusAnimationDuration: Duration.zero,
        borderSide: BorderSide.none,
        unFocusAnimationDuration: Duration.zero,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Container(
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/Images/Swipe-unscreen.gif"),
                            fit: BoxFit.cover)),
                  ),
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        " Swipe Down to connect with a user ",
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
        paddingFocus: 0.0,
        // focusAnimationDuration: Duration.zero,
        borderSide: BorderSide.none,
        unFocusAnimationDuration: Duration.zero,
        shape: ShapeLightFocus.Circle,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return Column(
                children: [
                  Container(
                    height: screenHeight(context, dividedBy: 5),
                    width: screenHeight(context, dividedBy: 5),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/Images/SwipeLeft-unscreen.gif"),
                            fit: BoxFit.cover)),
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
    return targets;
  }
}

Widget buttons(
    {required BuildContext context,
    required String img,
    required Function() onTap,
    required String buttonName,
    required bool bool}) {
  return Container(
    height: screenHeight(context, dividedBy: 25),
    width: screenWidth(context, dividedBy: bool ? 3.7 : 4.9),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: AppColor.Blue),
    child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img,
            height: screenHeight(context,
                dividedBy: img.endsWith("button3.svg") ? 80 : 65),
            width: screenHeight(context,
                dividedBy: img.endsWith("button3.svg") ? 80 : 65),
          ),
          // Container(
          //   height: screenHeight(context,
          //       dividedBy: img.endsWith("button1.svg") ? 80 : 65),
          //   width: screenHeight(context,
          //       dividedBy: img.endsWith("button1.svg") ? 80 : 65),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover,colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.color))
          //   ),
          // ),
          // Image(
          //   color: AppColor.white,
          //   image: AssetImage(img),
          //   height: screenHeight(context,
          //       dividedBy: img.endsWith("button1.png") ? 80 : 65),
          //   width: screenHeight(context,
          //       dividedBy: img.endsWith("button1.png") ? 80 : 65),
          // ),
          SizedBox(
            width: screenWidth(context, dividedBy: 90),
          ),
          Text(
            buttonName.tr(),
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto'),
          )
        ],
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
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: VideoPlayer(_controller))
        : Container(
            height: screenHeight(context),
            width: screenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColor.skyBlue,
              ),
            ),
          );
  }
}
