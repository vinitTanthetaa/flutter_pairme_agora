import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/Size_page.dart';

import '../helper/App_Colors.dart';
import 'chat.dart';

class Connection_Page extends StatefulWidget {
  const Connection_Page({super.key});

  @override
  State<Connection_Page> createState() => _Connection_PageState();
}

class _Connection_PageState extends State<Connection_Page> {
  List list = [
    {
      "Name": "Jane Koblenz",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU"
    },
    {
      "Name": "Virat Kohli",
      "image":
          "https://wallpapers.com/images/hd/virat-kohli-hd-black-tuxedo-fibgrtdlqvatdblj.jpg"
    },
    {
      "Name": "Hardik Pandeya",
      "image":
          "https://i.pinimg.com/originals/2e/31/a4/2e31a4fce6c52a98d518053d269d7eba.jpg"
    },
    {
      "Name": "Amitabh Bachchan",
      "image":
          "https://e1.pxfuel.com/desktop-wallpaper/85/759/desktop-wallpaper-%E2%9C%85-8-amitabh-bachchan-amitabh-bachchan-thumbnail.jpg"
    },
    {
      "Name": "Vincenzo cassano",
      "image":
          "https://e0.pxfuel.com/wallpapers/251/76/desktop-wallpaper-vincenzo-cassano-thumbnail.jpg"
    },
    {
      "Name": "Shahrukh khan",
      "image":
          "https://e0.pxfuel.com/wallpapers/531/653/desktop-wallpaper-shah-rukh-khan-actor-king-gentleman-shahrukhkhan-attitude.jpg"
    },
    {
      "Name": "Robert Downey jr",
      "image":
          "https://static.wikia.nocookie.net/ironman/images/7/79/Photo%28906%29.jpg/revision/latest?cb=20141019122536"
    },
    {
      "Name": "Johnny Depp",
      "image":
          "https://images.saymedia-content.com/.image/t_share/MTc0NDI1MDExOTk2NTk5OTQy/top-10-greatest-johnny-depp-movies-of-all-time.jpg"
    },
    {
      "Name": "úrsula corberó",
      "image":
          "https://www.bollywoodhungama.com/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-23-at-10.45.54-AM.jpeg"
    },
    {
      "Name": "Satoru Gojo",
      "image":
          "https://e0.pxfuel.com/wallpapers/666/451/desktop-wallpaper-white-hair-blue-eyes-satoru-gojo-jujutsu-kaisen.jpg"
    },
    {
      "Name": "Nanami Kento",
      "image": "https://wallpaperaccess.com/full/5661539.png"
    },
    {
      "Name": "Ryomen Sukuna",
      "image":
          "https://i1.sndcdn.com/artworks-Ovrge2921kVbhGxA-m3FQYA-t500x500.jpg"
    },
    {
      "Name": "Vijay Thalapathy",
      "image": "https://static.toiimg.com/photo/101080781.cms"
    },
    {
      "Name": "Yash",
      "image":
          "https://img.mensxp.com/media/content/2021/Jan/Lesser-Known-Facts-About-Yash-7_60056adf8c66e.jpeg?w=900&h=1200&cc=1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(backgroundColor: Colors.transparent),
        body: SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Stack(
        children: [
          Background_Img(context),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                titleSpacing: 0,
                centerTitle: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
                title: custom_header(text: "Connections"),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context, dividedBy: 30),
                        vertical: screenHeight(context, dividedBy: 200),
                      ),
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            // color: Colors.red,
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.only(top: 3.5),
                            hintText: "Search...",
                            hintStyle: TextStyle(fontSize: 15),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7),
                              child: SvgPicture.asset(
                                "assets/Images/search.svg",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(context, dividedBy: 30),
                          vertical: screenHeight(context, dividedBy: 70)),
                      child: const Text(
                        "4 Connection",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                            color: AppColor.skyBlue),
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(
                              bottom: screenHeight(context, dividedBy: 100),
                            ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                                height: screenHeight(context, dividedBy: 8),
                                width: screenHeight(context),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        screenWidth(context, dividedBy: 30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: list[index]["image"],
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: screenHeight(context,
                                              dividedBy: 15),
                                          width: screenHeight(context,
                                              dividedBy: 15),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,

                                              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                                radius: screenHeight(context,
                                                    dividedBy: 30),
                                                child:
                                                    const Icon(Icons.person)),
                                      ),
                                      SizedBox(
                                        width:
                                            screenWidth(context, dividedBy: 30),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: screenWidth(context,
                                                dividedBy: 40)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${list[index]["Name"]}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto'),
                                            ),
                                            SizedBox(
                                              height: screenHeight(context,
                                                  dividedBy: 300),
                                            ),
                                            SizedBox(
                                              width: screenWidth(context,
                                                  dividedBy: 2.2),
                                              child: const Text(
                                                  'Dis promethium, vei maximus gulag......',
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Color(0xffAAAAAA),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto')),
                                            ),
                                            SizedBox(
                                              height: screenHeight(context,
                                                  dividedBy: 70),
                                            ),
                                            SizedBox(
                                              width: screenWidth(context,
                                                  dividedBy: 2.2),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/Images/calendar.png",
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 40)),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  const Text("01/11/2024",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffAAAAAA),
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Roboto'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: screenWidth(context,
                                                  dividedBy: 40)),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                child: SvgPicture.asset(
                                                    "assets/Images/more.svg",
                                                    width: screenWidth(context,
                                                        dividedBy: 100)),
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 7.5),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Container(
                                                                width:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                height: 7,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          10),
                                                              decoration: const BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              16))),
                                                              child:
                                                                  const Center(
                                                                      child:
                                                                          ListTile(
                                                                title: Text(
                                                                    "Remove Connection"),
                                                                leading: Icon(
                                                                    Icons
                                                                        .delete),
                                                              )),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: screenWidth(context,
                                                    dividedBy: 20),
                                              ),
                                              SvgPicture.asset(
                                                  "assets/Images/message.svg",
                                                  width: screenWidth(context,
                                                      dividedBy: 25)),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 0,
                                thickness: 2,
                                color: Color(0xffF5F5F5),
                                // color: Colors.black12,
                              );
                            },
                            itemCount: list.length)),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

Widget NoMessage(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: SvgPicture.asset(
          "assets/Images/connection.svg",
          width: screenWidth(context, dividedBy: 5),
          height: screenHeight(context, dividedBy: 10),
        ),
      ),
      SizedBox(
        height: screenHeight(context, dividedBy: 14),
      ),
      InkWell(
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        onTap: () {},
        child: Center(
          child: Container(
            // margin: EdgeInsets.symmetric(
            //     horizontal: screenWidth(context, dividedBy: 5),
            //     vertical: 30),
            alignment: Alignment.center,
            height: screenHeight(context, dividedBy: 18),
            width: screenWidth(context, dividedBy: 1.7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(250, 250, 250, 1),
                // gradient: const LinearGradient(colors: [AppColor.skyBlue,AppColor.whiteskyBlue]),
                boxShadow: [
                  BoxShadow(
                    blurStyle: BlurStyle.normal,
                    color: Colors.black.withOpacity(0.15),
                    // color: Colors.transparent,
                    offset: const Offset(
                      1,
                      1,
                    ),
                    blurRadius: 10,
                    spreadRadius: 0.0,
                  ),
                ]),
            child: Text(
              "Browse More Profile",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  color: Colors.black87.withOpacity(0.8)),
            ),
          ),
        ),
      ),
      // Custom_botton(context, text:"Browse More Profile", onTap:() {
      //
      // }, height: screenHeight(context, dividedBy: 20))
    ],
  );
}
