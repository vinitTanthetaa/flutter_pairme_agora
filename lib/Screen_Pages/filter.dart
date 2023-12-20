import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gradient_slider/gradient_slider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/select.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Filter_page extends StatefulWidget {
  const Filter_page({super.key});

  @override
  State<Filter_page> createState() => _Filter_pageState();
}

class _Filter_pageState extends State<Filter_page> {
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _Contry = TextEditingController();
  final TextEditingController _State = TextEditingController();
  final TextEditingController _City = TextEditingController();
  List _type =[];

  List lookingFor = [
    'Investor',
    'Startup founder',
    'Corporate executive',
    'Manufacturer',
    'Distributor',
    'Channel partner',
    'Business partner',
    'Translator',
  ];
  bool _contry = false;
  bool _state = false;
  bool _city = false;
  double _slider = 10;
  bool _switch = false;
  String gender = 'Female';
  bool popup = false;
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
                titleSpacing: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                title: custom_header(text: "Filter by"),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context, dividedBy: 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                             // top: screenHeight(context,dividedBy: 80),
                              bottom: screenHeight(context,dividedBy: 90)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              custom_textfield_header(text: 'Maximum Distance'),
                              custom_textfield_header(text: '${_slider.toInt()}mi.'),
                            ],
                          ),
                        ),
                        Container(
                          height: screenHeight(context,dividedBy: 10),
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
                                  spreadRadius: 0.0,
                                ),
                              ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight(context,dividedBy: 30),
                                width: screenWidth(context),
                                child:
                                GradientSlider(
                                  thumbHeight: 20,
                                  thumbWidth: 20,
                                  trackHeight: 5,
                                  activeTrackGradient: const LinearGradient(colors: [AppColor.skyBlue, AppColor.whiteskyBlue]),
                                  inactiveTrackGradient:
                                  const LinearGradient(colors: [AppColor.gray, AppColor.gray]),
                                  slider: Slider(
                                      value: _slider,
                                      max: 100,
                                      onChanged: (value) {
                                        setState(() {
                                          _slider=value;
                                        });
                                      }
                                  ), thumbAsset: 'assets/Images/stepper.png',
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20)),
                                height: screenHeight(context,dividedBy: 30),
                                width: screenWidth(context),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _switch = !_switch;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: screenHeight(context,dividedBy: 45),
                                        width: screenHeight(context,dividedBy: 45),
                                        color: Color(0xffD4E2FF),
                                        child: Center(
                                          child: _switch ? Container(
                                            height: screenHeight(context,dividedBy: 65),
                                            width: screenHeight(context,dividedBy: 65),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                                            ),
                                          ) : const SizedBox(),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth(context,dividedBy: 70),),
                                      const Text('only show people in this range',textAlign: TextAlign.center,maxLines: 1,style: TextStyle(
                                          fontWeight: FontWeight.w400,fontFamily: 'Roboto',fontSize: 13,color: AppColor.fontdarkgray
                                      ),),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight(context,dividedBy: 70),),
                        custom_textfield_header(text: 'Gender'),
                        Custom_textfield(context, show_icon: true, onTap: () {
                          setState(() {
                            popup = !popup;
                          });
                        },onPress: () {
                          setState(() {
                            popup = !popup;
                          });
                        }, image: popup ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', hint: 'Select', controller: _gender, hidetext: false, readOnly: true),
                        popup ? FadeInDown(
                          animate: true,
                          from: 7,
                          child: Container(
                            height: screenHeight(context,dividedBy: 10),
                            width: screenWidth(context),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(height: screenHeight(context,dividedBy: 25),child:  Radio(value: "Female", groupValue: gender,activeColor: AppColor.skyBlue,onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                        _gender.text =gender;
                                        print("value :$value");
                                      });
                                    },),),
                                    const Text("Female",style: TextStyle(fontSize: 12,color: Color(0xff303030),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),)
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(height: screenHeight(context,dividedBy: 25),child:  Radio(value: "Male", groupValue: gender,activeColor: AppColor.skyBlue,onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                        _gender.text =gender;
                                        print("value :$value");
                                      });
                                    },),),
                                    const Text("Male",style: TextStyle(fontSize: 12,color: Color(0xff303030),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ) : const SizedBox(),
                        custom_textfield_header(text: 'Country'),
                        Custom_textfield(context, onTap: () {
                          setState(() {
                            _contry = !_contry;
                          });
                        },show_icon: true,image: _contry ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                          setState(() {
                            _contry = !_contry;
                          });
                        }, hint: "Select", hidetext: false, controller: _Contry),
                        _contry ?Container(
                          height: screenHeight(context,dividedBy: 7),
                          width: screenWidth(context),
                          margin: const EdgeInsets.only(bottom: 10),
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
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                              ],
                            ),
                          ),
                        ) : const SizedBox(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  custom_textfield_header(text: 'State'),
                                  Custom_textfield(context, onTap: () {
                                    setState(() {
                                      _state = !_state;
                                    });
                                  },show_icon: true,image: _state ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                    setState(() {
                                      _state = !_state;
                                    });
                                  }, hint: "Select", hidetext: false, controller: _State),
                                  _state ? Container(
                                    height: screenHeight(context,dividedBy: 7),
                                    width: screenWidth(context),
                                    margin: const EdgeInsets.only(bottom: 10),
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
                                        ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                          custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                          custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                          custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                        ],
                                      ),
                                    ),
                                  ) : SizedBox(height: _city ?screenHeight(context,dividedBy: 6.35) : 0,)
                                ],
                              ),
                            ),
                            SizedBox(width: screenWidth(context,dividedBy: 50),),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  custom_textfield_header(text: 'City'),
                                  Custom_textfield(onTap: () {
                                    setState(() {
                                      _city = !_city;
                                    });
                                  },context, show_icon: true,image: _city ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                    setState(() {
                                      _city = !_city;
                                    });
                                  }, hint: "Select", hidetext: false, controller: _City),
                                  _city? Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    height: screenHeight(context,dividedBy: 7),
                                    width: screenWidth(context),
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
                                        ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                          custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                          custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                          custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                        ],
                                      ),
                                    ),
                                  ):SizedBox(height:_state ? screenHeight(context,dividedBy: 6.35) : 0,)
                                ],
                              ),
                            )
                          ],),
                        custom_textfield_header(text: 'Looking for'),
                        Container(
                         margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 70)),
                        // height: screenHeight(context,dividedBy: 3.5),
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.fontgray,
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
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              direction: Axis.vertical,
                              children: lookingFor
                                  .map((e) => InkWell(
                                overlayColor: MaterialStatePropertyAll(Colors.white),
                                onTap: () {
                                  setState(() {
                                    _type.contains(e) ? _type.remove(e) :_type.add(e);
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: _type.contains(e)? const Color(0xff6D9Aff) : AppColor.fontgray,width: 2.5),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth(context,dividedBy: 27),
                                        vertical: screenHeight(context,dividedBy: 150),
                                      ),
                                      child: Text(e,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Roboto',color: _type.contains(e)? AppColor.black : AppColor.fontgray),),
                                    )),
                              ))
                                  .toList() ??
                                  [],
                            ),
                          ),
                          // ListView.builder(
                          //   padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 40),vertical: screenHeight(context,dividedBy: 100)),
                          //   itemCount: lookingFor.length,
                          //   physics: const ClampingScrollPhysics(),
                          //   itemBuilder: (context, index) {
                          //     return         custom_selection(context,bottom: 5 ,text: lookingFor[index], list: _type, onTap: () {
                          //       setState(() {
                          //         _type.contains(lookingFor[index]) ? _type.remove(lookingFor[index]) :_type.add(lookingFor[index]);
                          //       });
                          //     });
                          //   },),
                        )
                      ],
                    ) ,
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
