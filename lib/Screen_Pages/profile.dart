
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/user_profile_modal.dart';
import 'package:pair_me/Screen_Pages/edit_profile.dart';
import 'package:pair_me/Screen_Pages/location.dart';
import 'package:pair_me/Screen_Pages/premium_membership.dart';
import 'package:pair_me/Screen_Pages/view_pdf.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/cubits/user_profile_cubit.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({super.key});

  @override
  State<Profile_page> createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  final TextEditingController _bio = TextEditingController();
  UserDetailsCubit userDetailsCubit = UserDetailsCubit();
  UserProfile userProfile = UserProfile();
  int length = 0;
  GetData() async {
    userProfile = await userDetailsCubit.GetUserdetails() ?? UserProfile();
    print("user profile ===> $userProfile");
     length = userProfile.data?[1].companyName?.length ?? 0;
     _bio.text =userProfile.data?[2].bio ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      userDetailsCubit = BlocProvider.of<UserDetailsCubit>(context);
      GetData();
    setState(() {});
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
                centerTitle: false,
                title: Padding(
                  padding: EdgeInsets.only(left: screenWidth(context,dividedBy: 30)),
                  child: custom_header(text: "Profile"),
                ),
              ),
              body: BlocBuilder<UserDetailsCubit,UserDetailsState>(
              builder: (context, state) {
                print("stste  ===> $state");
                if(state is UserDetailsLoading){
                  return const Center(child: Text("Please wait ..."),);
                }
                if(state is UserDetailsSuccess){
                  return SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(context, dividedBy: 15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // height: screenHeight(context, dividedBy: 12),
                            width: screenWidth(context),
                            child: Row(
                              children: [
                                Container(
                                  height: screenHeight(context, dividedBy: 11.5),
                                  width: screenHeight(context, dividedBy: 11.5),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("${apis.baseurl}/${userProfile.data?[2].image?.photo1}"
                                            //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMVP7dBLbLgjKD8lHdaMcQz7XBf2E22eParQ&usqp=CAU'
                                          ),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  width: screenWidth(context, dividedBy: 35),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      userProfile.data?[0].name ?? '',
                                      style: const TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Role'.tr(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              color: AppColor.skyBlue),
                                        ),
                                        const Text(
                                          ' : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              color: AppColor.skyBlue),
                                        ),
                                        Text(
                                          userProfile.data?[1].addRole ?? '',
                                          style: const TextStyle(
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
                                          'Company'.tr(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              color: AppColor.skyBlue),
                                        ),
                                        const Text(
                                          ' : ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              fontFamily: 'Roboto',
                                              color: AppColor.skyBlue),
                                        ),
                                        Text(
                                          length >= 10 ? "${userProfile.data?[1].companyName?.substring(0,10)}...": userProfile.data?[1].companyName ?? '',
                                          style: const TextStyle(
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
                                            return Edit_Profile(id: userProfile.data?[0].id ??'',);
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
                                              color: AppColor.Blue
                                            // gradient: const LinearGradient(colors: [
                                            //   AppColor.skyBlue,
                                            //   AppColor.whiteskyBlue
                                            // ]),
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: screenHeight(context,
                                                      dividedBy: 60),
                                                  width: screenHeight(context,
                                                      dividedBy: 60),
                                                  decoration: const BoxDecoration(
                                                      image: DecorationImage(image: AssetImage("assets/Images/location.png"))
                                                  ),
                                                ),
                                                // Image(
                                                //   color: AppColor.white,
                                                //   image: const AssetImage(
                                                //       'assets/Images/location.png'),
                                                //   height: screenHeight(context,
                                                //       dividedBy: 60),
                                                //   width: screenHeight(context,
                                                //       dividedBy: 60),
                                                // ),
                                                SizedBox(
                                                  width: screenWidth(context,
                                                      dividedBy: 150),
                                                ),
                                                Text(
                                                  'Location'.tr(),
                                                  style: const TextStyle(
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
                          Padding(
                            padding:  EdgeInsets.only(bottom: screenHeight(context, dividedBy: 70),top: screenHeight(context, dividedBy: 100)),
                            child: LinearPercentIndicator(
                                width: screenWidth(context, dividedBy: 1.25),
                                lineHeight: 7.0,
                                percent:userProfile.data?[0].score == 5 ?1 :0.5 ,
                                barRadius: const Radius.circular(20),
                                backgroundColor: Colors.grey.shade200,
                                trailing:custom_text(text: "${userProfile.data?[0].score}/5", color: const Color(0xff434343)),
                                // progressColor: Colors.blue,
                                linearGradient: const LinearGradient(colors: [
                                  AppColor.skyBlue,
                                  AppColor.whiteskyBlue
                                ])),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 330.0),
                          //   child: custom_text(text: "2/5", color: Color(0xff434343)),
                          // ),
                          custom_textfield_header(text: 'Bio'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                                  horizontal: screenWidth(context, dividedBy: 25),
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
                          custom_textfield_header(text: 'My Documents'),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 150),
                          ),
                         // userProfile.data?[2].file?.file1.isNotEmpty ?
                          InkWell(
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Pdfview( pdfUrl: '${apis.baseurl}/${userProfile.data?[2].file?.file1}',);
                              },));
                            },
                            child: Container(
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
                            ),
                          ),
                              // : const SizedBox(),
                          // userProfile.data![2].file!.file2.isNotEmpty ? Container(
                          //   margin: EdgeInsets.symmetric(
                          //       vertical:
                          //       screenHeight(context, dividedBy: 190)),
                          //   height: screenHeight(context, dividedBy: 15),
                          //   width: screenWidth(context),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(7),
                          //     color: AppColor.white,
                          //     boxShadow: const [
                          //       BoxShadow(
                          //         color: AppColor.fontgray,
                          //         offset: Offset(
                          //           1,
                          //           1,
                          //         ),
                          //         blurRadius: 4,
                          //         // spreadRadius: 1.0,
                          //       ),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical:
                          //         screenHeight(context, dividedBy: 150),
                          //         horizontal:
                          //         screenWidth(context, dividedBy: 70)),
                          //     child: Row(
                          //       children: [
                          //         Container(
                          //           width:
                          //           screenWidth(context, dividedBy: 13),
                          //           decoration: const BoxDecoration(
                          //               image: DecorationImage(
                          //                   image: AssetImage(
                          //                       'assets/Images/uploadedfile.png'))),
                          //         ),
                          //         SizedBox(
                          //           width:
                          //           screenWidth(context, dividedBy: 50),
                          //         ),
                          //         const Column(
                          //           mainAxisAlignment:
                          //           MainAxisAlignment.center,
                          //           crossAxisAlignment:
                          //           CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'image_03.PDF ',
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.w500),
                          //             ),
                          //             Text(
                          //               '96.47 KB ',
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 10,
                          //                   fontWeight: FontWeight.w500),
                          //             )
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ) : const SizedBox(),
                          // userProfile.data![2].file!.file3.isNotEmpty ? Container(
                          //   margin: EdgeInsets.symmetric(
                          //       vertical:
                          //       screenHeight(context, dividedBy: 190)),
                          //   height: screenHeight(context, dividedBy: 15),
                          //   width: screenWidth(context),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(7),
                          //     color: AppColor.white,
                          //     boxShadow: const [
                          //       BoxShadow(
                          //         color: AppColor.fontgray,
                          //         offset: Offset(
                          //           1,
                          //           1,
                          //         ),
                          //         blurRadius: 4,
                          //         // spreadRadius: 1.0,
                          //       ),
                          //     ],
                          //   ),
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //         vertical:
                          //         screenHeight(context, dividedBy: 150),
                          //         horizontal:
                          //         screenWidth(context, dividedBy: 70)),
                          //     child: Row(
                          //       children: [
                          //         Container(
                          //           width:
                          //           screenWidth(context, dividedBy: 13),
                          //           decoration: const BoxDecoration(
                          //               image: DecorationImage(
                          //                   image: AssetImage(
                          //                       'assets/Images/uploadedfile.png'))),
                          //         ),
                          //         SizedBox(
                          //           width:
                          //           screenWidth(context, dividedBy: 50),
                          //         ),
                          //         const Column(
                          //           mainAxisAlignment:
                          //           MainAxisAlignment.center,
                          //           crossAxisAlignment:
                          //           CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'image_03.PDF ',
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.w500),
                          //             ),
                          //             Text(
                          //               '96.47 KB ',
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 10,
                          //                   fontWeight: FontWeight.w500),
                          //             )
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ) : const SizedBox(),
                          SizedBox(
                            height: screenHeight(context, dividedBy: 100),
                          ),
                          custom_textfield_header(text: 'Address'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                              child: Text(
                                "${userProfile.data?[0].address?.address}, ${userProfile.data?[0].address?.city}, ${userProfile.data?[0].address?.state}, ${userProfile.data?[0].address?.country} - ${userProfile.data?[0].address?.zipCode}",
                                style: TextStyle(
                                    color: Color(0xff434343),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ),
                          custom_textfield_header(text: 'Business Experience'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                              child: Text(
                                userProfile.data?[1].businessExperience ?? '1 year',
                                style: TextStyle(
                                    color: Color(0xff434343),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ),
                          custom_textfield_header(text: 'Skills'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                              child: Text(
                                userProfile.data?[1].skills ?? '1 year',
                                style: const TextStyle(
                                    color: Color(0xff434343),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ),
                          custom_textfield_header(text: 'Education'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                                  horizontal: screenWidth(context, dividedBy: 30)),
                              child:  Row(
                                children: [
                                  Text(
                                    userProfile.data?[1].education ?? '1 year',
                                    style: TextStyle(
                                        color: AppColor.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          custom_textfield_header(text: 'University'),
                          Container(
                            margin: EdgeInsets.only(
                                top: screenHeight(context, dividedBy: 100),
                                bottom: screenHeight(context, dividedBy: 70)),
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
                                  horizontal: screenWidth(context, dividedBy: 30)),
                              child: const Row(
                                children: [
                                  Text(
                                    'Veer Narmad South Gujarat University',
                                    style: TextStyle(
                                        color: AppColor.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
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
                                  return const PremiumMembership();
                                },
                              ));
                            },
                            height: screenHeight(context, dividedBy: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(child: Text("Please wait  ..."),);
              },)
            )
          ],
        ),
      ),
    );
  }
}
