import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class PremiumMembership extends StatefulWidget {
  const PremiumMembership({super.key});

  @override
  State<PremiumMembership> createState() => _PremiumMembershipState();
}

class _PremiumMembershipState extends State<PremiumMembership> {
  List data = [
    {'month' : '1 Month','ruppy':'\$413.85/per month'},
    {'name' : 'popular','month' : '6 Month','ruppy':'\$273.35/month','save':'Save 40%'},
    {'name' : 'Best value','month' : '12 Month','ruppy':'\$207.35/month','save':'Save 40%'}
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15)),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              size: 25,
                            )),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 70),
                        ),
                        custom_header(text: 'Premium membership')
                        // IconButton(onPressed: () {
                        //
                        // }, icon: Icon(Icons.close))
                      ],
                    ),
                    custom_discription(
                        text:
                            'Unlimited likes send as many likes as you want.'),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 60),
                    ),
                    custom_textfield_header(text: 'Select  a plan'),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 6),
                      width: screenWidth(context),
                     // color: Colors.red ,
                      child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                        return  Center(
                          child: InkWell(
                            onTap: () {

                            },
                            child: Container(
                              margin: EdgeInsets.only(right: screenWidth(context,dividedBy: 50),left: screenWidth(context,dividedBy: 100)),
                              height: screenHeight(context, dividedBy: 7.3),
                              width: screenWidth(context, dividedBy: 3),
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(7),
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
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(context, dividedBy: 30),
                                    vertical: screenWidth(context, dividedBy: 30)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    data[index]['name'] != null ? Text(
                                      data[index]['name'].toString(),
                                      style: TextStyle(
                                          color: AppColor.skyBlue,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 9),
                                    ) : const SizedBox() ,
                                     Text(
                                      data[index]['month'],
                                      style: const TextStyle(
                                          color: AppColor.black,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    ),
                                     Text(
                                      data[index]['ruppy'],
                                      style: const TextStyle(
                                          color: AppColor.dropdownfont,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10),
                                    ),
                                    data[index]['save'] != null ? Container(
                                      margin: EdgeInsets.only(left: screenWidth(context,dividedBy: 6),top: screenHeight(context,dividedBy: 650)),
                                      alignment: Alignment.center,
                                      height: screenHeight(context,dividedBy: 40),
                                      width: screenWidth(context,dividedBy: 9),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          gradient: const LinearGradient(colors: [AppColor.skyBlue,AppColor.whiteskyBlue])
                                      ),
                                      child: const Text('Save 40%',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w500,fontFamily: 'roboto',color: AppColor.white)),
                                    ) : const SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 70)),
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(7),
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
                          SizedBox(height: screenHeight(context,dividedBy: 200),),
                          textAndCheck(text: 'Unlimited Likes'),
                          textAndCheck(text: 'Unlimited Rewinds'),
                          textAndCheckANDDES(text: 'Unlimited Locations', desp: 'Match and chat with people any where in the world.'),
                          textAndCheck(text: 'Control who sees you manage who you’re seen by.'),
                          textAndCheck(text: 'Hide Ads'),
                        ],
                      ),
                    ),
                    Custom_botton(context, text: 'Continue', onTap: () {

                    }, height: screenHeight(context,dividedBy: 15))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget textAndCheck ({required String text}){
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight(context,dividedBy: 100)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 50)),
            height: screenHeight(context,dividedBy: 70),
            width: screenHeight(context,dividedBy: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/Images/check.png'))
            ),
          ),
           SizedBox(
             width: screenWidth(context,dividedBy: 1.5),
               child: Text(text,maxLines: 2,softWrap: true,style: const TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: AppColor.dropdownfont),))
        ],
      ),
    );
  }
  Widget textAndCheckANDDES ({required String text,required String desp}){
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight(context,dividedBy: 100)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 50)),
            height: screenHeight(context,dividedBy: 70),
            width: screenHeight(context,dividedBy: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/Images/check.png'))
            ),
          ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(text,style: const TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: AppColor.dropdownfont),),
               Text(desp,style: const TextStyle(fontSize: 8,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: AppColor.dropdownfont),),
             ],
           )
        ],
      ),
    );
  }
}
