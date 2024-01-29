import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pair_me/Screen_Pages/home.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

import 'chat.dart';
import 'message_request.dart';

class Invitation_page extends StatefulWidget {
  const Invitation_page({super.key});

  @override
  State<Invitation_page> createState() => _Invitation_pageState();
}

class _Invitation_pageState extends State<Invitation_page> {
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
                    // Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
                title: custom_header(text: "Invitation"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return const MessageRequest();
                        //   },
                        // ));
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Clear all',
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: AppColor.skyBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(thickness: 0.9),
                    Expanded(
                        child: ListView.separated(
                            physics: const ClampingScrollPhysics(),
                            padding: EdgeInsets.only(
                              bottom: screenHeight(context, dividedBy: 100),
                            ),
                            itemBuilder: (context, index) {
                              return Dismissible(
                                  // direction: DismissDirection.endToStart,
                                  key: UniqueKey(),
                                  background: Container(
                                    padding: EdgeInsets.only(
                                        right: screenWidth(context,
                                            dividedBy: 10)),
                                    color: AppColor.skyBlue,
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height:
                                          screenHeight(context, dividedBy: 35),
                                      width:
                                          screenWidth(context, dividedBy: 15),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/delete.png'))),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return Chatting_Page(
                                            name: 'Request',
                                            Username: list[index]['Name'],
                                            image: list[index]['image'], id: '',
                                          );
                                        },
                                      ));
                                    },
                                    child: SizedBox(
                                      // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                                      height:
                                          screenHeight(context, dividedBy: 8),
                                      width: screenHeight(context),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth(context,
                                              dividedBy: 30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                              errorWidget:
                                                  (context, url, error) =>
                                                      CircleAvatar(
                                                          radius: screenHeight(
                                                              context,
                                                              dividedBy: 30),
                                                          child: const Icon(
                                                              Icons.person)),
                                            ),
                                            SizedBox(
                                              width: screenWidth(context,
                                                  dividedBy: 30),
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Roboto'),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight(
                                                        context,
                                                        dividedBy: 300),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth(context,
                                                        dividedBy: 2.2),
                                                    child: const Text(
                                                        'Duis protium gravida denim, vei maximus ligula......',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffAAAAAA),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Roboto')),
                                                  ),
                                                  SizedBox(
                                                    height: screenHeight(
                                                        context,
                                                        dividedBy: 70),
                                                  ),
                                                  SizedBox(
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 2.2),
                                                      child: const Text(
                                                          "5 day ago",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffAAAAAA),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Roboto'))),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: screenWidth(
                                                        context,
                                                        dividedBy: 40)),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        "assets/Images/cancel.svg",
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 15)),
                                                    SizedBox(
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 25),
                                                    ),
                                                    SvgPicture.asset(
                                                        "assets/Images/accept.svg",
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 15)),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 0,
                                thickness: 2,
                                color: Color(0xffF5F5F5),
                                // color: Colors.black12,
                              );
                            },
                            itemCount: list.length))
                    // Expanded(
                    //   child: ListView.separated(
                    //     itemCount: list.length,
                    //     separatorBuilder: (BuildContext context, int index) =>
                    //         const Divider(),
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return ListTile(
                    //         leading:  CircleAvatar(
                    //           radius: 25,
                    //           backgroundImage: NetworkImage(
                    //             list[index]["image"],),
                    //         ),
                    //         title: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               const Text("Jane Kobold"),
                    //               const Text("sdfsd fsd fdsf "),
                    //               Row(
                    //                 children: [
                    //                   SvgPicture.asset(
                    //                     "assets/Images/calendar.png",
                    //                     width: 50,
                    //                     height: 50,
                    //                   )
                    //                 ],
                    //               )
                    //             ]),
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Center(
              //       child: SvgPicture.asset(
              //         "assets/Images/connection.svg",
              //         width: screenWidth(context, dividedBy: 4),
              //         height: screenHeight(context, dividedBy: 8),
              //       ),
              //     ),
              //     SizedBox(
              //       height: screenHeight(context, dividedBy: 12),
              //     ),
              //     InkWell(
              //       overlayColor:
              //           const MaterialStatePropertyAll(Colors.transparent),
              //       onTap: () {},
              //       child: Center(
              //         child: Container(
              //           // margin: EdgeInsets.symmetric(
              //           //     horizontal: screenWidth(context, dividedBy: 5),
              //           //     vertical: 30),
              //           alignment: Alignment.center,
              //           height: screenHeight(context, dividedBy: 18),
              //           width: screenWidth(context, dividedBy: 1.7),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(50),
              //               color: const Color.fromRGBO(250, 250, 250, 1),
              //               // gradient: const LinearGradient(colors: [AppColor.skyBlue,AppColor.whiteskyBlue]),
              //               boxShadow: [
              //                 BoxShadow(
              //                   blurStyle: BlurStyle.normal,
              //                   color: Colors.black.withOpacity(0.25),
              //                   // color: Colors.transparent,
              //                   offset: const Offset(
              //                     1,
              //                     1,
              //                   ),
              //                   blurRadius: 10,
              //                   spreadRadius: 0.0,
              //                 ),
              //               ]),
              //           child: const Text(
              //             "Browse More Profile",
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 16,
              //                 fontFamily: 'Roboto',
              //                 color: AppColor.black),
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              )
        ],
      ),
    ));
  }
}
