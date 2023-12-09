import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/prmium.dart';
import 'package:pair_me/Screen_Pages/edit_profile.dart';
import 'package:pair_me/Screen_Pages/location.dart';
import 'package:pair_me/Screen_Pages/premium_membership.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  TextEditingController _bio = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bio.text =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,.Lorem ipsum dolor sit amet, consectetur adipiscing elit,’';
  }

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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                title: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth(context, dividedBy: 30)),
                  child: custom_header(text: "Profile"),
                ),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight(context, dividedBy: 12.5),
                        width: screenWidth(context),
                        child: Row(
                          children: [
                            Container(
                              height: screenHeight(context, dividedBy: 11.5),
                              width: screenHeight(context, dividedBy: 11.5),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMVP7dBLbLgjKD8lHdaMcQz7XBf2E22eParQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: screenWidth(context, dividedBy: 50),
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Jane Koblenz',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Role: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          color: AppColor.skyBlue),
                                    ),
                                    Text(
                                      'CEO',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          color: AppColor.dropdownfont),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Company: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          color: AppColor.skyBlue),
                                    ),
                                    Text(
                                      'Infosys',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: 'Roboto',
                                          color: AppColor.dropdownfont),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const Edit_Profile();
                                      },
                                    ));
                                  },
                                  child: Container(
                                    height:
                                        screenHeight(context, dividedBy: 60),
                                    width: screenHeight(context, dividedBy: 60),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Images/edit.png'))),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight(context, dividedBy: 60),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const Location_page();
                                      },
                                    ));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height:
                                          screenHeight(context, dividedBy: 35),
                                      // width: screenWidth(context, dividedBy: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(colors: [
                                          AppColor.skyBlue,
                                          AppColor.whiteskyBlue
                                        ]),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth(context,
                                                dividedBy: 25)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image(
                                              color: AppColor.white,
                                              image: const AssetImage(
                                                  'assets/Images/location.png'),
                                              height: screenHeight(context,
                                                  dividedBy: 70),
                                              width: screenHeight(context,
                                                  dividedBy: 70),
                                            ),
                                            SizedBox(
                                              width: screenWidth(context,
                                                  dividedBy: 150),
                                            ),
                                            const Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: AppColor.white,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto'),
                                            )
                                          ],
                                        ),
                                      )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 20,
                        color: Color(0xffF5F5F5),
                      ),
                      custom_textfield_header(text: 'Intermediate'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    screenHeight(context, dividedBy: 100)),
                            child: LinearPercentIndicator(
                                width: screenWidth(context, dividedBy: 1.16),
                                lineHeight: 8,
                                percent: 0.5,
                                barRadius: const Radius.circular(20),
                                backgroundColor: Colors.lightBlue.shade50,

                                // progressColor: Colors.blue,
                                linearGradient: const LinearGradient(colors: [
                                  AppColor.skyBlue,
                                  AppColor.whiteskyBlue
                                ])),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 30),
                            ),
                            child: Text("2/5"),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 80),
                      ),
                      custom_textfield_header(text: 'Bio'),
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight(context, dividedBy: 50),
                            bottom: screenHeight(context, dividedBy: 100)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColor.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 8,
                              // spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 40),
                              vertical: screenHeight(context, dividedBy: 150)),
                          child: TextField(
                            controller: _bio,
                            maxLength: 250,
                            readOnly: true,
                            minLines: 1,
                            maxLines: 7,
                            cursorColor: AppColor.fontdarkgray,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff434343)),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              // hintText: 'Enter some words of your Profile',
                              // hintStyle: TextStyle(
                              //     fontFamily: 'Roboto',
                              //     fontWeight: FontWeight.w400,
                              //     fontSize: 15)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 50),
                      ),
                      custom_textfield_header(text: 'My Documents'),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 100),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 4.3),
                        width: screenWidth(context),
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          //padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 100)),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      screenHeight(context, dividedBy: 190)),
                              height: screenHeight(context, dividedBy: 15),
                              width: screenWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: AppColor.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 4,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        screenHeight(context, dividedBy: 150),
                                    horizontal:
                                        screenWidth(context, dividedBy: 70)),
                                child: Row(
                                  children: [
                                    Container(
                                      width:
                                          screenWidth(context, dividedBy: 13),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/uploadedfile.png'))),
                                    ),
                                    SizedBox(
                                      width:
                                          screenWidth(context, dividedBy: 50),
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'image_03.PDF ',
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '96.47 KB ',
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 100),
                      ),
                      custom_textfield_header(text: 'Address'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 100)),
                        alignment: Alignment.centerLeft,
                        // height: screenHeight(context,dividedBy: 17),
                        width: screenWidth(context, dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 30),
                              vertical: screenHeight(context, dividedBy: 100)),
                          child: const Text(
                            "Ground Floor, BL-91, Plot No. 13/24, Udhana - Magdalla Rd, near Dharti Namkin Udhna, Chandramani Society, Surat, Gujarat 395007",
                            style: TextStyle(
                                color: Color(0xff434343),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 200),
                      ),
                      custom_textfield_header(text: 'Business Experience '),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 100)),
                        alignment: Alignment.centerLeft,
                        height: screenHeight(context, dividedBy: 20),
                        width: screenWidth(context, dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 30),
                              vertical: screenHeight(context, dividedBy: 100)),
                          child: const Text(
                            "1 years",
                            style: TextStyle(
                                color: Color(0xff434343),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 200),
                      ),
                      custom_textfield_header(text: 'Skills'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 100)),
                        alignment: Alignment.centerLeft,
                        height: screenHeight(context, dividedBy: 20),
                        width: screenWidth(context, dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 30),
                              vertical: screenHeight(context, dividedBy: 100)),
                          child: const Text(
                            "Graphic Design",
                            style: TextStyle(
                                color: Color(0xff434343),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 200),
                      ),
                      custom_textfield_header(text: 'Education'),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 100)),
                        height: screenHeight(context, dividedBy: 15),
                        width: screenWidth(context, dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 30)),
                          child: Row(
                            children: [
                              Container(
                                height: screenHeight(context, dividedBy: 25),
                                width: screenWidth(context, dividedBy: 13),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Images/University.png'))),
                              ),
                              SizedBox(
                                width: screenWidth(context, dividedBy: 40),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'University of Portland',
                                    style: TextStyle(
                                        color: AppColor.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    'Portland, OR ‧ Private, non-profit ‧ 4-year',
                                    style: TextStyle(
                                        color: AppColor.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Custom_botton(
                        context,
                        text: 'Premium Membership',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const primium();
                            },
                          ));
                        },
                        height: screenHeight(context, dividedBy: 20),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
