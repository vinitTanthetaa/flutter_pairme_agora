import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:pair_me/Screen_Pages/change_password.dart';
import 'package:pair_me/Screen_Pages/payment.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({super.key});

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  bool language = false;
  bool show_box = false;
  bool icon = false;
  final List _language = [
    'English',
    'Spanish',
    'Hindi',
    'Cantonese',
    'Mandarin',
  ];
  addFolderNameDialog( {required String name,required String describ,required String cancel,required String remove,required Function() onTap}) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60),
      backgroundColor: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: [
        Padding(
          padding:  EdgeInsets.only(left: screenWidth(context,dividedBy: 20),bottom: screenHeight(context,dividedBy: 100)),
          child:  Text(name,textAlign: TextAlign.left,maxLines: 1,style: const TextStyle(color: AppColor.black,fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'Roboto'),),
        ),
        const Divider(
          height: 0,
          color: Color(0xffF5F5F5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 100)),
          child: Text(describ,textAlign: TextAlign.center,maxLines: 2,style: const TextStyle(color: AppColor.fontdarkgray,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [AppColor.skyBlue, AppColor.whiteskyBlue]),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child:  Text(cancel,style: const TextStyle(fontFamily: 'Roboto',fontSize: 15,fontWeight: FontWeight.w600,color: AppColor.skyBlue),),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal:screenWidth(context,dividedBy: 10),vertical: height),
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(colors: [AppColor.skyBlue,AppColor.whiteskyBlue]),
                  ),
                  child:  Text(remove,style:  const TextStyle(fontWeight: FontWeight.w600,fontSize: 15,fontFamily: 'Roboto',color: AppColor.white),),
                ),
              )
            ],
          ),
        )
      ],
    );
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
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header_Space(context),
                    custom_header(text: 'Settings'),
                    SizedBox(height: screenHeight(context,dividedBy: 30),),
                    Container(
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow:  const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              // spreadRadius: 1.0,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ChangePassword();
                            },));
                            // setState(() {
                            //   language = !language;
                            //   if(language == false){
                            //     show_box = !show_box;
                            //     Timer(Duration(milliseconds: 600), () {
                            //       setState(() {
                            //         show_box = !show_box;
                            //       });
                            //     });
                            //   }
                            //
                            // });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //_selected_language == '' ?  const
                              const Text("Change Password",style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                              //:
                              // Text(_selected_language,style: const TextStyle(color: AppColor.black,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              icon ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.black,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    Container(
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow:  const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              // spreadRadius: 1.0,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            setState(() {
                              language = !language;
                              if(language == false){
                                show_box = !show_box;
                                Timer(const Duration(milliseconds: 600), () {
                                  setState(() {
                                    show_box = !show_box;
                                  });
                                });
                              }

                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //_selected_language == '' ?  const
                              const Text("Language",style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                                  //:
                             // Text(_selected_language,style: const TextStyle(color: AppColor.black,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              language ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.black,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    language ?
                    FadeInDown(
                      animate: true,
                      from: 10,
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight(context,dividedBy: 60)),
                        height: screenHeight(context,dividedBy: 7),
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                custom_text(text: "English", color: AppColor.fontdarkgray),
                                custom_text(text: "Spanish", color: AppColor.fontdarkgray),
                                custom_text(text: "Hindi", color: AppColor.fontdarkgray),
                                custom_text(text: "Cantonese", color: AppColor.fontdarkgray),
                                custom_text(text: "Mandarin", color: AppColor.fontdarkgray),
                              ],
                            )
                        ),
                      ),
                    ) : show_box ? FadeOutUp(
                      animate: true,
                      from: 10,
                      child: Container(
                        margin: EdgeInsets.only(bottom: screenHeight(context,dividedBy: 60)),
                        height: screenHeight(context,dividedBy: 7),
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                custom_text(text: "English", color: AppColor.fontdarkgray),
                                custom_text(text: "Spanish", color: AppColor.fontdarkgray),
                                custom_text(text: "Hindi", color: AppColor.fontdarkgray),
                                custom_text(text: "Cantonese", color: AppColor.fontdarkgray),
                                custom_text(text: "Mandarin", color: AppColor.fontdarkgray),
                              ],
                            )
                        ),
                      ),
                    ) : const SizedBox(),
                    Container(
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow:  const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              // spreadRadius: 1.0,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return PaymentPage();
                            },));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Payment",style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                              icon ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.black,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    Container(
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow:  const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              // spreadRadius: 1.0,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            // setState(() {
                            //   language = !language;
                            //   if(language == false){
                            //     show_box = !show_box;
                            //     Timer(Duration(milliseconds: 600), () {
                            //       setState(() {
                            //         show_box = !show_box;
                            //       });
                            //     });
                            //   }
                            //
                            // });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //_selected_language == '' ?  const
                              const Text("Privacy Policy",style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                              //:
                              // Text(_selected_language,style: const TextStyle(color: AppColor.black,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              icon ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.black,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    Container(
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow:  const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              // spreadRadius: 1.0,
                            ),
                          ]
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            // setState(() {
                            //   language = !language;
                            //   if(language == false){
                            //     show_box = !show_box;
                            //     Timer(Duration(milliseconds: 600), () {
                            //       setState(() {
                            //         show_box = !show_box;
                            //       });
                            //     });
                            //   }
                            //
                            // });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //_selected_language == '' ?  const
                              const Text("Terms & Conditions",style: TextStyle(color: AppColor.black,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                              //:
                              // Text(_selected_language,style: const TextStyle(color: AppColor.black,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              icon ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.black,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.black,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context,builder: (context) => addFolderNameDialog(name: 'Confirm Logout', describ: 'Are you sure you want to logout?', cancel: 'Cancel', remove: 'OK', onTap: () {
                          Navigator.pop(context);
                        }),);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: screenHeight(context,dividedBy: 17),
                        width: screenWidth(context,dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow:  const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                          child:   const Text("Logout",style: TextStyle(color: Color(0xffFF0000),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    GestureDetector(
                      onTap: () {
                        showDialog(context: context,builder: (context) => addFolderNameDialog(name: 'Delete Account', describ: 'Are you sure you want to delete account?', cancel: 'Cancel', remove: 'Delete', onTap: () {
                          Navigator.pop(context);
                        }),);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: screenHeight(context,dividedBy: 17),
                        width: screenWidth(context,dividedBy: 1.15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow:  const [
                              BoxShadow(
                                color: AppColor.fontgray,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                          child:   const Text("Delete Account",style: TextStyle(color: Color(0xffFF0000),fontSize: 15,fontWeight: FontWeight.w500,fontFamily: "Roboto"),),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
