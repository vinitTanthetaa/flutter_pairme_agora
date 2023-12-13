import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class PremiumMembership extends StatefulWidget {
  const PremiumMembership({super.key});

  @override
  State<PremiumMembership> createState() => _PremiumMembershipState();
}

class _PremiumMembershipState extends State<PremiumMembership> {
  List data = [
    {
      'month': '1 Month',
      'ruppy': '\$413.85/per month',
      'des':
          'Unlock all of our features to be in completecontrol of your experience'
    },
    {
      'name': 'popular',
      'month': '6 Month',
      'ruppy': '\$273.35/month',
      'save': 'Save 40%',
      'des':
          'Unlock all of our features to be in completecontrol of your experience'
    },
    {
      'name': 'Best value',
      'month': '12 Month',
      'ruppy': '\$207.35/month',
      'save': 'Save 40%',
      'des':
          'Unlock all of our features to be in completecontrol of your experience'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                titleSpacing: screenWidth(context, dividedBy: 55),
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                bottom: PreferredSize(preferredSize:const Size.fromHeight(0.0),child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),

                  child: custom_discription(
                      text:
                      'Unlimited likes send as many likes as you want.'),
                ),),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth(context, dividedBy: 17)),
                      child: Icon(Icons.close),
                    )),
                centerTitle: false,
                title: custom_header(text: "Premium membership"),
              ),
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 15)),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: screenHeight(context, dividedBy: 60),
                        // ),
                        custom_textfield_header(text: 'Select a plan'),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenHeight(context, dividedBy: 50),top: screenHeight(context, dividedBy: 100)),
                          child: SizedBox(
                            height: screenHeight(context, dividedBy: 5),
                            width: screenWidth(context),
                            child: PageView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Center(
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      // margin: EdgeInsets.only(
                                      //     right: screenWidth(context, dividedBy: 100)),
                                       height:
                                       screenHeight(context, dividedBy: 5.28),
                                      width: screenWidth(context, dividedBy: 1.2),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius: BorderRadius.circular(23),
                                          gradient: data[index] == 0
                                              ? const LinearGradient(
                                              colors: [
                                                AppColor.skyBlue,
                                                Color(0xff6D9AFF)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)
                                              : const LinearGradient(
                                              colors: [
                                                Color(0xff2468FF),
                                                Color(0xff5BC8FF)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
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
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            screenWidth(context, dividedBy: 30),
                                            vertical: screenWidth(context,
                                                dividedBy: 30)),
                                        child: Column(
                                          children: [
                                            // data[index]['name'] != null ? Text(
                                            //   data[index]['name'].toString(),
                                            //   style: TextStyle(
                                            //       color: AppColor.skyBlue,
                                            //       fontFamily: 'Roboto',
                                            //       fontWeight: FontWeight.w500,
                                            //       fontSize: 9),
                                            // ) : const SizedBox() ,
                                            Text(
                                              data[index]['month'],
                                              style: const TextStyle(
                                                  color: AppColor.white,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Unlock all of our features to be in complete control of your experience',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: data[index]['save'] != null
                                                  ? screenHeight(context,
                                                  dividedBy: 200)
                                                  : 0,
                                            ),
                                            data[index]['save'] != null
                                                ? const Text('Save 40%',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'roboto',
                                                    color: AppColor.white))
                                                : const SizedBox(),
                                            data[index]['ruppy'] != null
                                                ? Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight(context,
                                                      dividedBy: 100)),
                                              alignment: Alignment.center,
                                              height: screenHeight(context,
                                                  dividedBy: 30),
                                              width: screenWidth(context,
                                                  dividedBy: 3.5),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20),
                                                  color: AppColor.white),
                                              child: Text(
                                                  data[index]['ruppy'],
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontFamily: 'roboto',
                                                      color: AppColor.black)),
                                            )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth(context, dividedBy: 25),
                              right: screenWidth(context, dividedBy: 15)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'What you get:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              Text(
                                '1 Month',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context,dividedBy: 150),
                        ),
                        Newtext(text: 'Unlimited Likes'),
                        Newtext(text: 'Beeline'),
                        Newtext(text: 'Advanced filters'),
                        Newtext(text: 'Incognito mode'),
                        Newtext(text: 'Travel mode'),
                        Newtext(text: '5 SuperSwipes a Week'),
                        Newtext(text: 'Unlimited Locations'),
                        Newtext(text: 'Hide Ads'),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 70)),
                        //   width: screenWidth(context),
                        //   decoration: BoxDecoration(
                        //       color: AppColor.white,
                        //       borderRadius: BorderRadius.circular(7),
                        //       boxShadow: const [
                        //         BoxShadow(
                        //           color: Colors.grey,
                        //           offset: Offset(
                        //             1,
                        //             1,
                        //           ),
                        //           blurRadius: 4,
                        //           spreadRadius: 0.0,
                        //         ),
                        //       ]
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       SizedBox(height: screenHeight(context,dividedBy: 200),),
                        //       textAndCheck(text: 'Unlimited Likes'),
                        //       textAndCheck(text: 'Unlimited Rewinds'),
                        //       textAndCheckANDDES(text: 'Unlimited Locations', desp: 'Match and chat with people any where in the world.'),
                        //       textAndCheck(text: 'Control who sees you manage who you’re seen by.'),
                        //       textAndCheck(text: 'Hide Ads'),
                        //     ],
                        //   ),
                        // ),
                        Custom_botton(context,
                            text: 'Continue',
                            onTap: () {},
                            height: screenHeight(context, dividedBy: 20))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textAndCheck({required String text}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: screenHeight(context, dividedBy: 100)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth(context, dividedBy: 50)),
            height: screenHeight(context, dividedBy: 70),
            width: screenHeight(context, dividedBy: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/check.png'))),
          ),
          SizedBox(
              width: screenWidth(context, dividedBy: 1.5),
              child: Text(
                text,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: AppColor.dropdownfont),
              ))
        ],
      ),
    );
  }

  Widget textAndCheckANDDES({required String text, required String desp}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: screenHeight(context, dividedBy: 100)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: screenWidth(context, dividedBy: 50)),
            height: screenHeight(context, dividedBy: 70),
            width: screenHeight(context, dividedBy: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/check.png'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: AppColor.dropdownfont),
              ),
              Text(
                desp,
                style: const TextStyle(
                    fontSize: 8,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: AppColor.dropdownfont),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget Newtext({required String text}) {
    return Padding(
      padding: EdgeInsets.only(top: screenHeight(context, dividedBy: 90)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context, dividedBy: 25)),
            child: Row(
              children: [
                SizedBox(
                    width: screenWidth(context, dividedBy: 1.55),
                    child: Text(
                      text,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          color: AppColor.black),
                    )),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 45)),
                  height: screenHeight(context, dividedBy: 70),
                  width: screenHeight(context, dividedBy: 70),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Images/check.png'))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 90),
          ),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Colors.grey,
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          )
        ],
      ),
    );
  }
}
