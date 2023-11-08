import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pair_me/Screen_Pages/videocall.dart';
import 'package:pair_me/Screen_Pages/voice_call.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Chatting_Page extends StatefulWidget {
  String name;
   Chatting_Page({super.key,required this.name});

  @override
  State<Chatting_Page> createState() => _Chatting_PageState();
}

class _Chatting_PageState extends State<Chatting_Page> {
bool showCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:widget.name == 'chatting' ? SizedBox() :  Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40)),
              height: screenHeight(context,dividedBy: 15),
              width: screenWidth(context,dividedBy: 4),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.fontgray,
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: 11,
                      spreadRadius: 0.0,
                    ),
                  ]
              ),
              child: Text('Block',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Color(0xffFF0000)),),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40)),
              height: screenHeight(context,dividedBy: 15),
              width: screenWidth(context,dividedBy: 4),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.fontgray,
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: 11,
                      spreadRadius: 0.0,
                    ),
                  ]
              ),
              child: Text('Delete',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Color(0xffFF0000)),),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40)),
              height: screenHeight(context,dividedBy: 15),
              width: screenWidth(context,dividedBy: 4),
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(23),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.fontgray,
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: 11,
                      spreadRadius: 0.0,
                    ),
                  ]
              ),
              child: const Text('Accept',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Roboto',color: Color(0xff1D1D1D)),),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight(context, dividedBy: 9),
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColor.skyBlue, AppColor.whiteskyBlue])),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth(context, dividedBy: 15),
                      right: screenWidth(context, dividedBy: 15),
                      top: screenHeight(context, dividedBy: 25),
                      bottom: screenHeight(context, dividedBy: 60),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: const AssetImage('assets/Images/back.png'),
                            height: screenHeight(context, dividedBy: 40),
                            width: screenHeight(context, dividedBy: 70),
                            color: AppColor.white,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 25),
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 15),
                          width: screenHeight(context, dividedBy: 15),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: screenHeight(context, dividedBy: 15),
                                width: screenHeight(context, dividedBy: 15),
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
                                        fit: BoxFit.fill),
                                    border: Border.all(
                                        color: AppColor.white, width: 1),
                                    shape: BoxShape.circle),
                              ),
                             widget.name == 'Request' ? SizedBox() : Positioned(
                                  bottom: 3.0,
                                  left: 3.0,
                                  child: Container(
                                    height:
                                        screenHeight(context, dividedBy: 70),
                                    width: screenHeight(context, dividedBy: 70),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff04D364),
                                        border: Border.all(
                                            color: AppColor.white, width: 1),
                                        shape: BoxShape.circle),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 95),
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jane Koblenz',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto'),
                            ),
                            widget.name == 'Request' ? Text(
                              'Just Joined',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto'),
                            ) : Text(
                              'online',
                              style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Roboto'),
                            ),
                          ],
                        ),
                        const Spacer(),
                        widget.name == 'Request' ? SizedBox() : GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const VoiceCallPage();
                            },));
                          },
                          child: Image(
                            image: const AssetImage('assets/Images/call.png'),
                            height: screenHeight(context, dividedBy: 40),
                            width: screenHeight(context, dividedBy: 40),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 25),
                        ),
                        widget.name == 'Request' ? SizedBox() : GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const VideoCallPage();
                            },));
                          },
                          child: Image(
                            image: const AssetImage('assets/Images/videoCall.png'),
                            height: screenHeight(context, dividedBy: 35),
                            width: screenHeight(context, dividedBy: 30),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               Expanded(child: Container(
                 child:SingleChildScrollView(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         margin: EdgeInsets.only(
                             left: screenWidth(context, dividedBy: 15),top: screenHeight(context,dividedBy: 100)),
                         width: screenWidth(context, dividedBy: 1.5),
                         decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 bottomRight: Radius.circular(16),
                                 topRight: Radius.circular(16),
                                 topLeft: Radius.circular(16)),
                             color: Color(0xffE8E8E8)),
                         child: Padding(
                           padding:
                           EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                           child: const Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(
                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                                 style: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'Roboto',
                                     color: Color(0xff606164)),
                               ),
                               Text(
                                 '01:32 PM',
                                 style: TextStyle(
                                     fontFamily: 'Roboto',
                                     fontWeight: FontWeight.w500,
                                     fontSize: 7,
                                     color: Color(0xff4A4A4A)),
                               )
                             ],
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(
                             left: screenWidth(context, dividedBy: 1.7),
                             top: screenHeight(context,dividedBy: 100)),
                         width: screenWidth(context, dividedBy: 3),
                         decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 bottomLeft: Radius.circular(16),
                                 topRight: Radius.circular(16),
                                 topLeft: Radius.circular(16)),
                             color: AppColor.skyBlue),
                         child: Padding(
                           padding:
                           EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                           child: const Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'Hey, how are you?',
                                 style: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'Roboto',
                                     color: AppColor.white),
                               ),
                               Text(
                                 '01:32 PM',
                                 style: TextStyle(
                                     fontFamily: 'Roboto',
                                     fontWeight: FontWeight.w500,
                                     fontSize: 7,
                                     color: AppColor.white),
                               )
                             ],
                           ),
                         ),
                       ),
                       Container(
                         margin: EdgeInsets.only(
                             left: screenWidth(context, dividedBy: 15),top: screenHeight(context,dividedBy: 100)),
                         width: screenWidth(context, dividedBy: 1.5),
                         decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                                 bottomRight: Radius.circular(16),
                                 topRight: Radius.circular(16),
                                 topLeft: Radius.circular(16)),
                             color: Color(0xffE8E8E8)),
                         child: Padding(
                           padding:
                           EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                           child: const Column(
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                                 style: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w500,
                                     fontFamily: 'Roboto',
                                     color: Color(0xff606164)),
                               ),
                               Text(
                                 '01:32 PM',
                                 textAlign: TextAlign.end,
                                 style: TextStyle(
                                     fontFamily: 'Roboto',
                                     fontWeight: FontWeight.w500,
                                     fontSize: 7,
                                     color: Color(0xff4A4A4A)),
                               )
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               )),
                showCard ? Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth(context, dividedBy: 15),),
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColor.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            1,
                            1,
                          ),
                          blurRadius: 4,
                          spreadRadius: 0.0,
                        ),
                      ]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15),vertical: screenHeight(context,dividedBy: 100)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenHeight(context,dividedBy: 17),
                              width: screenWidth(context,dividedBy: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: screenWidth(context,dividedBy: 40)),
                                    height: screenHeight(context,dividedBy: 40),
                                    width: screenWidth(context,dividedBy: 15),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/Images/camera.png'))
                                    ),
                                  ),
                                  const Text('Camera',style: TextStyle(fontFamily: 'Roboto',fontSize: 17,fontWeight: FontWeight.w500,color: AppColor.dropdownfont),),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(height: 0,),
                      Padding (
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15),vertical: screenHeight(context,dividedBy: 100)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenHeight(context,dividedBy: 17),
                              width: screenWidth(context,dividedBy: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: screenWidth(context,dividedBy: 40)),
                                    height: screenHeight(context,dividedBy: 40),
                                    width: screenWidth(context,dividedBy: 15),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))
                                    ),
                                  ),
                                  const Text('Photos & Videos',style: TextStyle(fontFamily: 'Roboto',fontSize: 17,fontWeight: FontWeight.w500,color: AppColor.dropdownfont),),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(height: 0,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15),vertical: screenHeight(context,dividedBy: 100)),
                        child: Row(
                          children: [
                            SizedBox(
                              height: screenHeight(context,dividedBy: 17),
                              width: screenWidth(context,dividedBy: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(image: AssetImage('assets/Images/file.png'),
                                    height: screenHeight(context,dividedBy: 30),
                                    width: screenWidth(context,dividedBy: 15),
                                    color: Color(0xff5D5D5D),
                                  ),
                                  SizedBox(width: screenWidth(context,dividedBy: 50),),
                                  const Text('Document',style: TextStyle(fontFamily: 'Roboto',fontSize: 17,fontWeight: FontWeight.w500,color: AppColor.dropdownfont),),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ) : const SizedBox(),
                widget.name == 'Request' ? SizedBox() : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      right: screenWidth(context, dividedBy: 15),
                      left: screenWidth(context, dividedBy: 15),
                      bottom: screenHeight(context, dividedBy: 20),
                      top: screenHeight(context, dividedBy: 55),
                  ),
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            1,
                            1,
                          ),
                          blurRadius: 4,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Message...',
                        hintStyle: const TextStyle(
                            color: Color(0xff888888),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400),
                        prefixIcon: IconButton(
                          splashRadius: 1,
                          style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          onPressed: () {},
                          icon: Container(
                            height: screenHeight(context, dividedBy: 30),
                            width: screenWidth(context, dividedBy: 20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/Images/send.png'))),
                          ),
                        ),
                        suffixIcon: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: screenWidth(context, dividedBy: 40),
                                  left: screenWidth(context, dividedBy: 300)),
                              height: screenHeight(context, dividedBy: 30),
                              width: screenWidth(context, dividedBy: 20),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Images/emoji.png'))),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showCard = !showCard;
                                });
                              },
                              child: Container(
                                height: screenHeight(context, dividedBy: 30),
                                width: screenWidth(context, dividedBy: 20),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Images/pin.png'))),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: screenWidth(context, dividedBy: 30),
                                  left: screenWidth(context, dividedBy: 40)),
                              height: screenHeight(context, dividedBy: 30),
                              width: screenWidth(context, dividedBy: 30),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/Images/mic.png'))),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
