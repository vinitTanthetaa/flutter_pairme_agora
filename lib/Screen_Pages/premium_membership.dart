import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/cubits/payments.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class PremiumMembership extends StatefulWidget {
  const PremiumMembership({super.key});

  @override
  State<PremiumMembership> createState() => _PremiumMembershipState();
}

class _PremiumMembershipState extends State<PremiumMembership> {
  PremiumMembershipCubit premiumMembershipCubit = PremiumMembershipCubit();
  List data = [
    {
      'month': '1 Month',
      'ruppy': '\$14.99 USD\n(auto-renews each month)',
      'des':
      'Unlock all of our features to be in completecontrol of your experience'
    },
    {
      'name': 'popular',
      'month': '6 Month',
      'ruppy': '\$7.50 USD\n per month (\$40.00 USD, paid up-front)',
      'des':
      'Unlock all of our features to be in completecontrol of your experience'
    },
    {
      'name': 'Best value',
      'month': '12 Month',
      'ruppy': '\$4.99 USD\n per month (\$59.89 USD, paid up-front)',
      'des':
      'Unlock all of our features to be in completecontrol of your experience'
    }
  ];
  List month1 = [
    "Unlimited swipes",
    "Unlimited rewinds",
    "Unlimited connection requests",
    "PairMe Premium badge"
  ];
  List month6 = [
    "Unlimited swipes",
    "Unlimited rewinds",
    "Unlimited messaging",
    "Unlimited rewinds",
    "Unlimited connection requests",
    "PairMe Premium badge",
    "PairMe Premium badge",
    "Advertisements hidden",
  ];

  int ind = 0;

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
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth(context, dividedBy: 17)),
                      child: const Icon(Icons.close),
                    )),
                centerTitle: false,
                title: custom_header(text: "Premium Membership"),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 15)),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        custom_discription(
                            text:
                            'Unlimited likes send as many likes as you want.'),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 60),
                        ),
                        const Text(
                          "Select a plan",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis,
                              color: AppColor.black),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: screenHeight(context, dividedBy: 40),
                              top: screenHeight(context, dividedBy: 100)),
                          child: SizedBox(
                            height: screenHeight(context, dividedBy: 5),
                            width: screenWidth(context),
                            child: PageView.builder(
                              onPageChanged: (value) {
                                print("hello" + value.toString());
                                setState(() {
                                  ind = value;
                                });
                              },
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
                                      height: screenHeight(context,
                                          dividedBy: 5.28),
                                      width:
                                      screenWidth(context, dividedBy: 1.2),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius:
                                          BorderRadius.circular(23),
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
                                            horizontal: screenWidth(context,
                                                dividedBy: 30),
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
                                              height:
                                              data[index]['save'] != null
                                                  ? screenHeight(context,
                                                  dividedBy: 200)
                                                  : 0,
                                            ),
                                            data[index]['save'] != null
                                                ? const Text('Save 40%',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontFamily: 'roboto',
                                                    color: AppColor.white))
                                                : const SizedBox(),
                                            data[index]['ruppy'] != null
                                                ? Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight(
                                                      context,
                                                      dividedBy: 100)),
                                              alignment: Alignment.center,
                                              // height: screenHeight(
                                              //     context,
                                              //     dividedBy: 18),
                                              width: screenWidth(
                                                context,
                                                dividedBy: 2.3,
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(20),
                                                  color: AppColor.white),
                                              child: Padding(
                                                padding:
                                                EdgeInsets.symmetric(
                                                    horizontal:
                                                    screenWidth(
                                                        context,
                                                        dividedBy:
                                                        50),
                                                    vertical:
                                                    screenHeight(
                                                        context,
                                                        dividedBy:
                                                        95)),
                                                child: Text(
                                                    data[index]['ruppy'],
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontFamily:
                                                        'roboto',
                                                        color: AppColor
                                                            .black),
                                                    textAlign:
                                                    TextAlign.center),
                                              ),
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
                          height: screenHeight(context, dividedBy: 90),
                        ),
                        Newtext(text: 'Unlimited swipes'),
                        Newtext(text: 'Unlimited rewinds'),
                        Newtext(text: 'Unlimited messaging'),
                        Newtext(text: 'Unlimited connection requests'),
                        Newtext(text: 'Boost your profile’s visibility'),
                        Newtext(text: 'In-app video call / phone call feature'),
                        Newtext(text: 'PairMe Premium badge'),
                        Newtext(text: 'Advertisements hidden'),
                        Custom_botton(context, text: 'Continue', onTap: () {
                          premiumMembershipCubit.PremiumMembershipService(
                              product: ind == 0
                                  ? "Basic"
                                  : ind == 1
                                  ? "Plus"
                                  : "Pro",
                              context: context);
                        }, height: screenHeight(context, dividedBy: 20))
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 45)),
                  child: Image(
                    fit: BoxFit.fill,
                    image: const AssetImage("assets/Images/check.png"),
                    color: ind == 2
                        ? AppColor.skyBlue
                        : ind == 1
                        ? month6.contains(text)
                        ? AppColor.skyBlue
                        : AppColor.fontgray
                        : month1.contains(text)
                        ? AppColor.skyBlue
                        : AppColor.fontgray,
                    height: screenHeight(context, dividedBy: 70),
                    width: screenHeight(context, dividedBy: 50),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context, dividedBy: 90),
          ),
          const DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: Color(0xffCFCFCF),
            dashRadius: 0.0,
            dashGapLength: 4.0,
            dashGapColor: Colors.transparent,
            dashGapRadius: 0.0,
          ),
        ],
      ),
    );
  }
}