import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/home_screen.dart';
import 'package:pair_me/Screen_Pages/professional_details.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/Widgets/select.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Widgets/custom_button.dart';
import 'address_details.dart';

class StepScreen extends StatefulWidget {
  const StepScreen({super.key});

  @override
  State<StepScreen> createState() => _StepScreenState();
}

class _StepScreenState extends State<StepScreen> {
  int ind = 0;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  bool _contry = false;
  bool _state = false;
  bool _city = false;
  bool calendar = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _Address1 = TextEditingController();
  final TextEditingController _Address2 = TextEditingController();
  final TextEditingController _Address3 = TextEditingController();
  final TextEditingController _Zipcode = TextEditingController();
  final TextEditingController _Contry = TextEditingController();
  final TextEditingController _State = TextEditingController();
  final TextEditingController _City = TextEditingController();
  final TextEditingController _compnyName = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _compnyDomain = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _experiencecontroller = TextEditingController();
  final TextEditingController _skillcontroller = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _educationcontroller = TextEditingController();
  final TextEditingController _date = TextEditingController();
  SelectedByte? _selectedimag1;
  SelectedByte? _selectedimag2;
  SelectedByte? _selectedimag3;
  String img= '';
  String Uname= '';
  final List _categorys = [
    'Entrepreneurship',
    'Leadership',
    'Management',
    'Finance',
  ];
  final List _experiences = [
    '1 years',
    '2 years',
    '3 years',
    '4 years',
  ];
  final List _skills = [
    'Graphic Design',
    'Web Design',
    'Communication',
    'Project management',
    'Problem solving',
    'Creativity',
    'Data analysis',
    'Software development',
    'Presentation',
    'Data mining',
    'Troubleshooting',
    'Artificial intelligence',
    'Machine learning',
    'Cloud computing',
    'Cybersecurity',
    'Blockchain and cryptocurrencies',
    'Analytical thinking',
    'Application Development',
    'Architecture',
    'UI / UX',
  ];
  List lookingFor = [
    'Investor',
    'Startup Founder',
    'Corporate Executive',
    'Manufacturer',
    'Distributor',
    'Channel Partner',
    'Business Partner',
    'Translator',
  ];
  final List _type = [];
  final List _type1 = [];
  List filelist = [];
  bool _category = false;
  bool _experience = false;
  bool _skill = false;
  bool _education = false;
  final dio = Dio();

  void getHttp() async {
    // citys
    final response = await dio.get('https://countriesnow.space/api/v0.1/countries',);
    // State
    final response1 = await dio.get('https://countriesnow.space/api/v0.1/countries/states',);
    final response2 = await dio.get('http://universities.hipolabs.com/search?country=United+States',);
    print(response);
    print(response1);
    print(response2);

  }
  addFolderNameDialog(String delete) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60),
      backgroundColor: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Are you sure you want to remove file?',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Roboto'),
          ),
        ),
        const Divider(
          height: 0,
          color: Color(0xffF5F5F5),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                          colors: [AppColor.skyBlue, AppColor.whiteskyBlue]),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.skyBlue),
                  ),
                ),
              ),
              GestureDetector(
                onTap:() {
                  filelist.remove(delete);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal:screenWidth(context,dividedBy: 10),vertical: height),
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                        colors: [AppColor.skyBlue, AppColor.whiteskyBlue]),
                  ),
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: AppColor.white),
                  ),
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
            ind == 0 ?
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy:10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Address Details")),
                        skip_button(context, onTap: () {
                         setState(() {
                           ind++;
                         });
                        },)
                      ],
                    ),
                    custom_discription(text: "Please show some alternative font designs throughout the app"),
                    SizedBox(height: screenHeight(context,dividedBy: 50),),
                    custom_textfield_header(text: 'Address'),
                    Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                    }, hint: "Address line 1",mxline: 2, hidetext: false, controller: _Address),
                    Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                    }, hint: "Address line 2",mxline: 2, hidetext: false, controller: _Address2),
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
                    custom_textfield_header(text: 'Post code / Zip code'),
                    Custom_textfield(context, show_icon: false,number: true, readOnly: false, onPress: () {

                    }, hint: "Post code / Zip code", hidetext: false, controller: _Zipcode),
                    Custom_botton(context, text: 'Next', onTap: () {
                      setState(() {
                        ind++;
                      });
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return Professional_Details(Name: '',);
                        // },));

                    }, height: screenHeight(context,dividedBy: 20),)
                  ],
                ),
              ),
            ) : ind == 1 ?
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy: 10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Professional Details")),
                        skip_button(context, onTap: () {
                          setState(() {
                            ind++;
                          });
                        },)
                      ],
                    ),
                    custom_discription(
                        text:
                        "Your new password cannot be the same as a previous password."),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    custom_textfield_header(text: 'Company Name'),
                    Custom_textfield(context,
                        show_icon: false,
                        onPress: () {},
                        hint: 'Company Name',
                        controller: _compnyName,
                        hidetext: false,
                        readOnly: false),
                    custom_textfield_header(text: 'Add role / Job title',header: true),
                    Custom_textfield(context,
                        show_icon: false,
                        onPress: () {},
                        hint: 'Job title',
                        controller: _jobTitle,
                        hidetext: false,
                        readOnly: false),
                    custom_textfield_header(text: 'Company Domain'),
                    Custom_textfield(context,
                        show_icon: false,
                        onPress: () {},
                        hint: 'Company Domain',
                        controller: _compnyDomain,
                        hidetext: false,
                        readOnly: false),
                    custom_textfield_header(text: 'Email',header: true),
                    Custom_textfield(context,
                        show_icon: false,
                        onPress: () {},
                        hint: 'Your email',
                        controller: _email,
                        hidetext: false,
                        readOnly: false),
                    custom_textfield_header(text: 'Category',header: true),
                    Custom_textfield(context,
                        show_icon: true,
                        image: _category ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png',
                        onTap: () {
                          setState(() {
                            _category = !_category;
                          });
                        },
                        readOnly: true, onPress: () {
                          setState(() {
                            _category = !_category;
                          });
                        },
                        hint: 'Select',
                        hidetext: false,
                        controller: _categorycontroller),
                    _category
                        ? Container(
                      height: screenHeight(context, dividedBy: 8),
                      width: screenWidth(context),
                      margin: EdgeInsets.only(bottom: screenHeight(context,dividedBy: 150)),
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
                          ]),
                      child: Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: screenHeight(context,dividedBy: 100), horizontal: 10),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const ClampingScrollPhysics(),
                            itemCount: _categorys.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: screenHeight(context,dividedBy: 150)),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _categorycontroller.text =
                                        _categorys[index];
                                        _category = !_category;
                                      });
                                    },
                                    child: custom_text(
                                        text: _categorys[index],
                                        color: const Color(0xff303030))),
                              );
                            },
                          )
                      ),
                    )
                        : const SizedBox(),
                    custom_textfield_header(text: 'Business Experience'),
                    Custom_textfield(context,
                        show_icon: true,
                        image: _experience ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png',
                        onTap: () {
                          setState(() {
                            _experience = !_experience;
                          });
                        },
                        readOnly: true, onPress: () {
                          setState(() {
                            _experience = !_experience;
                          });
                        },
                        hint: "Select",
                        hidetext: false,
                        controller: _experiencecontroller),
                    _experience
                        ? Container(
                      height: screenHeight(context, dividedBy: 7.5),
                      width: screenWidth(context),
                      margin: const EdgeInsets.only(bottom: 10),
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
                          ]),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight(context,dividedBy: 70), horizontal: 10),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: _experiences.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: screenHeight(context,dividedBy: 100)),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _experiencecontroller.text =
                                        _experiences[index];
                                        _experience = !_experience;
                                      });
                                    },
                                    child: custom_text(
                                        text: _experiences[index],
                                        color: const Color(0xff303030))),
                              );
                            },
                          )),
                    )
                        : const SizedBox(),
                    custom_textfield_header(text: 'Skills'),
                    Custom_textfield(context,
                        show_icon: true,
                        image: _skill ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png',
                        onTap: () {
                          setState(() {
                            _skill = !_skill;
                          });
                        },
                        readOnly: true, onPress: () {
                          setState(() {
                            _skill = !_skill;
                          });
                        },
                        hint: "Select",
                        hidetext: false,
                        controller: _skillcontroller),
                    _skill
                        ? Container(

                      height: screenHeight(context, dividedBy: 7.5),
                      width: screenWidth(context),
                      margin: const EdgeInsets.only(bottom: 10),
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
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight(context,dividedBy: 85),),
                          Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 10),
                            child: custom_text(
                                text: _skills[0],
                                color: const Color(0xff303030)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 10,vertical: 5),
                            child: custom_text(
                                text: _skills[1],
                                color: const Color(0xff303030)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 10),
                            child: custom_text(
                                text: _skills[2],
                                color: const Color(0xff303030)),
                          ),
                          SizedBox(height: screenHeight(context,dividedBy: 85),),
                          const Divider(
                            height: 0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: screenHeight(context,dividedBy: 30),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Show all 17 skills',style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'Roboto',fontSize: 10,color: AppColor.skyBlue),),
                                Container(
                                  margin: EdgeInsets.only(left: screenWidth(context,dividedBy: 65)),
                                  height: screenHeight(context,dividedBy: 65),
                                  width: screenWidth(context,dividedBy: 30),
                                  child: const Image(image: AssetImage('assets/Images/LineArrow.png')),
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                        : const SizedBox(),
                    custom_textfield_header(text: 'Education'),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 75)),
                      height: screenHeight(context,dividedBy: 17),
                      width: screenWidth(context,dividedBy: 1.15),
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
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 30)),
                        child:   InkWell(
                          onTap: () {
                            setState(() {
                              _education = !_education;
                              // if(language == false){
                              //   show_box = !show_box;
                              //   Timer(Duration(milliseconds: 600), () {
                              //     setState(() {
                              //       show_box = !show_box;
                              //     });
                              //   });
                              // }

                            });
                          },
                          child:img == '' ||  Uname == ''? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //  _selected_language == '' ?
                              const Text("Select",style: TextStyle(color: AppColor.fontgray,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              //  :
                              // Text(_selected_language,style: const TextStyle(color: AppColor.black,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: "Roboto"),),
                              _education ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.fontgray,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.fontgray,)
                            ],
                          ) :Row(
                            children: [
                              Container(
                                height: screenHeight(context,dividedBy: 25),
                                width: screenWidth(context,dividedBy: 13),
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage(img))
                                ),
                              ),
                              SizedBox(width: screenWidth(context,dividedBy: 40),),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Uname,style: const TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 15),),
                                  const Text('Portland, OR ‧ Private, non-profit ‧ 4-year',style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 10),),
                                ],
                              ),
                              const Spacer(),
                              _education ? const Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: AppColor.fontgray,) : const Icon(Icons.arrow_forward_ios_sharp,size: 15,color: AppColor.fontgray,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    // Custom_textfield(context,
                    //     show_icon: true,
                    //     image: _education ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png',
                    //     onTap: () {
                    //       setState(() {
                    //         _education = !_education;
                    //       });
                    //     },
                    //     readOnly: true, onPress: () {
                    //   setState(() {
                    //     _education = !_education;
                    //   });
                    // },
                    //     hint: "Select",
                    //     hidetext: false,
                    //     controller: _educationcontroller),
                    _education
                        ? Container(
                      height: screenHeight(context, dividedBy: 6),
                      width: screenWidth(context),
                      margin: const EdgeInsets.only(bottom: 10),
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
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  img = 'assets/Images/University.png';
                                  Uname = 'University of Portland';
                                  _education = !_education;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: screenHeight(context,dividedBy: 25),
                                    width: screenWidth(context,dividedBy: 13),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/Images/University.png'))
                                    ),
                                  ),
                                  SizedBox(width: screenWidth(context,dividedBy: 40),),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('University of Portland',style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 15),),
                                      Text('Portland, OR ‧ Private, non-profit ‧ 4-year',style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 10),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight(context,dividedBy: 205),),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  img = 'assets/Images/University1.png';
                                  Uname = 'University of Portland';
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: screenHeight(context,dividedBy: 25),
                                    width: screenWidth(context,dividedBy: 13),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(image: AssetImage('assets/Images/University1.png'))
                                    ),
                                  ),
                                  SizedBox(width: screenWidth(context,dividedBy: 40),),
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('University of Portland',style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 15),),
                                      Text('Portland, OR ‧ Private, non-profit ‧ 4-year',style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 10),),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: screenHeight(context,dividedBy: 85),),
                            const Divider(
                              height: 0,
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: screenHeight(context,dividedBy: 50),
                              child: const Text('Show all education',style: TextStyle(fontSize: 10,color: AppColor.skyBlue,fontWeight: FontWeight.w400,fontFamily: 'Roboto')),
                            )
                          ],
                        ),
                      ),
                    )
                        : const SizedBox(),
                    Center(
                      child: Custom_botton(
                        context,
                        text: 'Next',
                        onTap: () {
                          setState(() {
                            ind++;
                          });
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return  Business_Address(Name: '',);
                            // },));

                        }, height: screenHeight(context,dividedBy: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ) : ind == 2 ?
            SingleChildScrollView(
              physics:const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy:10),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Business or Professional Address")),
                        skip_button(context, onTap: () {
                          setState(() {
                            ind++;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return Business_Profile(Name: '',);
                          // },));
                        },)
                      ],
                    ),
                    custom_discription(text: "Your new password cannot be the same as a previous password."),
                    SizedBox(height: screenHeight(context,dividedBy: 50),),
                    custom_textfield_header(text: 'Address'),
                    Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                    }, hint: "Address line 1",mxline: 2, hidetext: false, controller: _Address1),
                    Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                    }, hint: "Address line 2",mxline: 2, hidetext: false, controller: _Address3),
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
                              Custom_textfield(context, show_icon: true,onTap: () {
                                setState(() {
                                  _state = !_state;
                                });
                              },image: _state ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
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
                              Custom_textfield(context, show_icon: true,onTap: () {
                                setState(() {
                                  _city = !_city;
                                });
                              },image: _city ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
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
                    custom_textfield_header(text: 'Post code / Zip code'),
                    Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                    }, hint: "Post code / Zip code",number: true, hidetext: false, controller: _Zipcode),
                    custom_textfield_header(text: 'Start Date'),
                    Custom_textfield(context,onTap: () {
                      setState(() {
                        calendar = !calendar;
                      });
                    }, show_icon: true, image: 'assets/Images/calendar.png',onPress: () {
                      setState(() {
                        calendar = !calendar;
                      });
                    }, hint: 'Select ', controller: _date, hidetext: false,readOnly: true),
                    calendar ? Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        headerStyle: const HeaderStyle(
                          titleTextStyle: TextStyle(
                              color: AppColor.skyBlue,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                          formatButtonVisible: false,
                          titleCentered: true,
                          leftChevronIcon: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: AppColor.black,
                          ),
                          rightChevronIcon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: AppColor.black,
                          ),
                        ),
                        calendarStyle: const CalendarStyle(
                          defaultTextStyle: TextStyle(fontFamily: 'Roboto',color: AppColor.black),
                          disabledTextStyle: TextStyle(fontFamily: 'Roboto',color: AppColor.skyBlue),

                        ),
                        focusedDay: _focusedDay,
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                        selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDate, selectedDay)){
                            print('selectedDay${DateFormat('dd MMM yy').format(selectedDay)}');
                            _date.text = DateFormat('dd MMM yy').format(selectedDay);
                            setState(() {
                              _selectedDate = selectedDay;
                              _focusedDay = focusedDay;
                              // update `_focusedDay` here as well
                            });
                          }
                        },
                      ),
                    ) :const SizedBox(),
                    Custom_botton(context, text: 'Next', onTap: () {
                      setState(() {
                        ind++;
                      });
                    }, height: screenHeight(context,dividedBy: 20),)
                  ],
                ),
              ),
            ) : ind == 3 ?
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy:10),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Profile")),
                        skip_button(
                          context,
                          onTap: () {
                            setState(() {
                              ind++;
                            });
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const Describe_Yourself();
                            //   },
                            // ));
                          },
                        )
                      ],
                    ),
                    custom_discription(
                        text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image: _selectedimag1?.selectedFile != null ?
                                DecorationImage(
                                  //  image: AssetImage('assets/Images/vincenzo.png'),
                                    image: FileImage(_selectedimag1!.selectedFile),
                                    fit: BoxFit.fill) :
                                const DecorationImage(
                                    image: AssetImage('assets/Images/placeHolderImage.png'), fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker.pickBoth(
                                                              source: ImageSource.both,
                                                              /// On long tap, it will be available.
                                                              multiSelection: true,
                                                              galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                                appTheme: AppTheme(
                                                                    focusColor:
                                                                    Colors.white,
                                                                    primaryColor:
                                                                    Colors.black),
                                                                cropImage: true,
                                                                showImagePreview:
                                                                true,
                                                              ),
                                                            );
                                                            print('Details ===> ${details}');
                                                            if(details != null) {
                                                             // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag1 = details!.selectedFiles[0];
                                                              Navigator.pop(context);
                                                              setState(() { });
                                                              print('selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                            }
                                                            // if (details != null) await displayDetails(details);
                                                          },
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/camera.png'))),
                                                              ),
                                                              const Text(
                                                                'Camera',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize: 17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source: ImageSource.gallery,
                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print('Details ===> ${details}');
                                                      if(details != null) {
                                                        //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                        _selectedimag1 = details!.selectedFiles[0];
                                                        Navigator.pop(context);
                                                        setState(() { });
                                                        print('selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                      }
                                                      // if (details != null) await displayDetails(details);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image:
                                _selectedimag2?.selectedFile != null ?
                                DecorationImage(
                                  //  image: AssetImage('assets/Images/vincenzo.png'),
                                    image: FileImage(_selectedimag2!.selectedFile),
                                    fit: BoxFit.fill) :
                                const DecorationImage(
                                    image: AssetImage('assets/Images/placeHolderImage.png'),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/camera.png'))),
                                                            ),
                                                            const Text(
                                                              'Camera',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source:
                                                        ImageSource.gallery,

                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print('Details ===> ${details}');
                                                      _selectedimag2 = details!.selectedFiles[0];
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                      print('selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                      setState(() {});
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image:
                                _selectedimag3?.selectedFile != null ?
                                DecorationImage(
                                  //  image: AssetImage('assets/Images/vincenzo.png'),
                                    image: FileImage(_selectedimag3!.selectedFile),
                                    fit: BoxFit.fill) :
                                DecorationImage(
                                    image: AssetImage('assets/Images/placeHolderImage.png'),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/camera.png'))),
                                                            ),
                                                            const Text(
                                                              'Camera',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source:
                                                        ImageSource.gallery,
                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print('Details ===> ${details}');
                                                      _selectedimag3 = details!.selectedFiles[0];
                                                      print('selectedByte ==> ${_selectedimag3?.selectedFile}');
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                      // if (details != null) await displayDetails(details);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 90),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Images/placeHolderImage.png'),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/camera.png'))),
                                                            ),
                                                            const Text(
                                                              'Camera',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source:
                                                        ImageSource.gallery,

                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print(
                                                          'Details ===> ${details}');
                                                      //   print('selectedByte ==> ${selectedByte.selectedFile}');
                                                      // if (details != null) await displayDetails(details);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Images/placeHolderImage.png'),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/camera.png'))),
                                                            ),
                                                            const Text(
                                                              'Camera',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source:
                                                        ImageSource.gallery,

                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print(
                                                          'Details ===> ${details}');
                                                      //   print('selectedByte ==> ${selectedByte.selectedFile}');
                                                      // if (details != null) await displayDetails(details);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            height: screenHeight(context, dividedBy: 8),
                            width: screenHeight(context, dividedBy: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.fontgray,
                                    offset: Offset(
                                      1,
                                      1,
                                    ),
                                    blurRadius: 5,
                                    // spreadRadius: 1.0,
                                  ),
                                ],
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/Images/placeHolderImage.png'),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: screenHeight(context,
                                                dividedBy: 3.1),
                                            decoration: const BoxDecoration(
                                                color: AppColor.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(15),
                                                    topRight:
                                                    Radius.circular(16))),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 70)),
                                                  child: const Text(
                                                    'Add Media',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 25,
                                                        fontWeight:
                                                        FontWeight.w600),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/camera.png'))),
                                                            ),
                                                            const Text(
                                                              'Camera',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      ImagePickerPlus picker =
                                                      ImagePickerPlus(
                                                          context);
                                                      SelectedImagesDetails?
                                                      details =
                                                      await picker.pickBoth(
                                                        source:
                                                        ImageSource.gallery,

                                                        /// On long tap, it will be available.
                                                        multiSelection: true,
                                                        galleryDisplaySettings:
                                                        GalleryDisplaySettings(
                                                          appTheme: AppTheme(
                                                              focusColor:
                                                              Colors.white,
                                                              primaryColor:
                                                              Colors.black),
                                                          cropImage: true,
                                                          showImagePreview:
                                                          true,
                                                        ),
                                                      );
                                                      print(
                                                          'Details ===> ${details}');
                                                      //   print('selectedByte ==> ${selectedByte.selectedFile}');
                                                      // if (details != null) await displayDetails(details);
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                        40)),
                                                                height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                    40),
                                                                width:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                    15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/placeholder.png'))),
                                                              ),
                                                              const Text(
                                                                'Photos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                    'Roboto',
                                                                    fontSize:
                                                                    17,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      vertical: screenHeight(
                                                          context,
                                                          dividedBy: 100)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: screenHeight(
                                                            context,
                                                            dividedBy: 17),
                                                        width: screenWidth(
                                                            context,
                                                            dividedBy: 2),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.only(
                                                                  right: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                      40)),
                                                              height:
                                                              screenHeight(
                                                                  context,
                                                                  dividedBy:
                                                                  40),
                                                              width:
                                                              screenWidth(
                                                                  context,
                                                                  dividedBy:
                                                                  15),
                                                              decoration: const BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          'assets/Images/video.png'))),
                                                            ),
                                                            const Text(
                                                              'Videos',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'Roboto',
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                                  color: AppColor
                                                                      .dropdownfont),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height:
                                      screenHeight(context, dividedBy: 30),
                                      width:
                                      screenHeight(context, dividedBy: 30),
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/add.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 80),
                    ),
                    const Text(
                      'Pitch Deck',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeight(context, dividedBy: 80)),
                      // height: screenHeight(context, dividedBy: 3.5),
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15),
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
                            vertical: screenHeight(context, dividedBy: 50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DottedBorder(
                              color: AppColor.skyBlue,
                              strokeWidth: 1,
                              child: GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    // allowMultiple: true,
                                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                                  );
                                  filelist.length < 3 ?
                                  filelist.add(result!.names.toString()) :
                                  flutterToast('Only 3 items Add', false);
                                  print("fille ======> " + result!.names.toString());
                                  print("fille ======> " + result.files.toString());
                                  print("fille ======> " + result.paths.toString());
                                  setState(() {});
                                },
                                child: SizedBox(
                                  height: screenHeight(context, dividedBy: 13),
                                  width: screenWidth(context, dividedBy: 3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                        screenHeight(context, dividedBy: 25),
                                        width:
                                        screenWidth(context, dividedBy: 10),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/upload.png'))),
                                      ),
                                      const Text(
                                        'Browse file to upload',
                                        style: TextStyle(
                                            color: AppColor.skyBlue,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10,
                                            decoration: TextDecoration.underline,
                                            decorationColor: AppColor.skyBlue,
                                            fontFamily: 'Roboto'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            filelist.length == 1 ?
                            Container(
                              margin: EdgeInsets.only(
                                  top: screenHeight(context, dividedBy: 100)),
                              height: screenHeight(context, dividedBy: 15),
                              width: screenWidth(context, dividedBy: 1.3),
                              decoration: BoxDecoration(
                                  color: const Color(0xffEFF4FF),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    screenWidth(context, dividedBy: 55)),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: screenWidth(context,
                                              dividedBy: 90)),
                                      height:
                                      screenHeight(context, dividedBy: 27),
                                      width:
                                      screenWidth(context, dividedBy: 15),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/file.png'))),
                                    ),
                                    SizedBox(
                                      height:
                                      screenHeight(context, dividedBy: 23),
                                      width:
                                      screenWidth(context, dividedBy: 1.55),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'image_01.jpg',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                    AppColor.dropdownfont),
                                              ),
                                              Text(
                                                '96.47 KB',
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff838383)),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    addFolderNameDialog(filelist[0]),
                                              );
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: AppColor.skyBlue,
                                              size: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ) : filelist.length == 2 ?
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight(context, dividedBy: 100)),
                                  height: screenHeight(context, dividedBy: 15),
                                  width: screenWidth(context, dividedBy: 1.3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FF),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, dividedBy: 55)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 90)),
                                          height:
                                          screenHeight(context, dividedBy: 27),
                                          width:
                                          screenWidth(context, dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/file.png'))),
                                        ),
                                        SizedBox(
                                          height:
                                          screenHeight(context, dividedBy: 23),
                                          width:
                                          screenWidth(context, dividedBy: 1.55),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'image_01.jpg',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        AppColor.dropdownfont),
                                                  ),
                                                  Text(
                                                    '96.47 KB',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff838383)),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        addFolderNameDialog(filelist[0]),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.skyBlue,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight(context, dividedBy: 100)),
                                  height: screenHeight(context, dividedBy: 15),
                                  width: screenWidth(context, dividedBy: 1.3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FF),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, dividedBy: 55)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 90)),
                                          height:
                                          screenHeight(context, dividedBy: 27),
                                          width:
                                          screenWidth(context, dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/file.png'))),
                                        ),
                                        SizedBox(
                                          height:
                                          screenHeight(context, dividedBy: 23),
                                          width:
                                          screenWidth(context, dividedBy: 1.55),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'image_02.jpg',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        AppColor.dropdownfont),
                                                  ),
                                                  Text(
                                                    '96.47 KB',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff838383)),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        addFolderNameDialog(filelist[1]),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.skyBlue,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ) : filelist.length == 3 ?
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight(context, dividedBy: 100)),
                                  height: screenHeight(context, dividedBy: 15),
                                  width: screenWidth(context, dividedBy: 1.3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FF),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, dividedBy: 55)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 90)),
                                          height:
                                          screenHeight(context, dividedBy: 27),
                                          width:
                                          screenWidth(context, dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/file.png'))),
                                        ),
                                        SizedBox(
                                          height:
                                          screenHeight(context, dividedBy: 23),
                                          width:
                                          screenWidth(context, dividedBy: 1.55),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'image_01.jpg',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        AppColor.dropdownfont),
                                                  ),
                                                  Text(
                                                    '96.47 KB',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff838383)),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        addFolderNameDialog(filelist[0]),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.skyBlue,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight(context, dividedBy: 100)),
                                  height: screenHeight(context, dividedBy: 15),
                                  width: screenWidth(context, dividedBy: 1.3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FF),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, dividedBy: 55)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 90)),
                                          height:
                                          screenHeight(context, dividedBy: 27),
                                          width:
                                          screenWidth(context, dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/file.png'))),
                                        ),
                                        SizedBox(
                                          height:
                                          screenHeight(context, dividedBy: 23),
                                          width:
                                          screenWidth(context, dividedBy: 1.55),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'image_02.jpg',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        AppColor.dropdownfont),
                                                  ),
                                                  Text(
                                                    '96.47 KB',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff838383)),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        addFolderNameDialog(filelist[1]),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.skyBlue,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: screenHeight(context, dividedBy: 100)),
                                  height: screenHeight(context, dividedBy: 15),
                                  width: screenWidth(context, dividedBy: 1.3),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEFF4FF),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                        screenWidth(context, dividedBy: 55)),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 90)),
                                          height:
                                          screenHeight(context, dividedBy: 27),
                                          width:
                                          screenWidth(context, dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/file.png'))),
                                        ),
                                        SizedBox(
                                          height:
                                          screenHeight(context, dividedBy: 23),
                                          width:
                                          screenWidth(context, dividedBy: 1.55),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'image_03.jpg',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color:
                                                        AppColor.dropdownfont),
                                                  ),
                                                  Text(
                                                    '96.47 KB',
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 8,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff838383)),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        addFolderNameDialog(filelist[2]),
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: AppColor.skyBlue,
                                                  size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ) : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Bio',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeight(context, dividedBy: 90)),
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
                          maxLength: 250,
                          minLines: 1,
                          maxLines: 7,
                          controller: _bio,
                          cursorColor: AppColor.fontdarkgray,
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColor.dropdownfont),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter some words of your Profile',
                              hintStyle: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15)),
                        ),
                      ),
                    ),
                    Custom_botton(
                      context,
                      text: 'Next',
                      onTap: () {
                        setState(() {
                          ind++;
                        });
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return const Describe_Yourself();
                          //   },
                          // ));

                      },
                      height: screenHeight(context, dividedBy: 20),
                    )
                  ],
                ),
              ),
            ) : ind == 4 ?
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 10),
                    ),

                    //custom_stepper(context, positaion: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: custom_header(
                                text:
                                "How would you best describe yourself? Select up to 3 of the following:")),
                        skip_button(
                          context,
                          onTap: () {
                            setState(() {
                              ind++;
                            });
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return const Looking_for();
                            //   },
                            // ));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 1.75),
                      width: screenWidth(context),
                      child: ListView.builder(
                        itemCount: lookingFor.length,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return custom_selection(context,
                              top: screenHeight(context, dividedBy: 50),
                              text: lookingFor[index],
                              list: _type, onTap: () {
                                if (_type.length < 3) {
                                  setState(() {
                                    _type.contains(lookingFor[index])
                                        ? _type.remove(lookingFor[index])
                                        : _type.add(lookingFor[index]);
                                  });
                                } else {
                                  setState(() {
                                    _type.remove(lookingFor[index]);
                                  });
                                }
                              });
                        },
                      ),
                    ),
                    Custom_botton(context, text: 'Done', onTap: () {
                      setState(() {
                        ind++;
                      });
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return const Looking_for();
                      //   },
                      // ));
                    }, height: screenHeight(context, dividedBy: 25))
                  ],
                ),
              ),
            ) :
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy: 10),),
                    // custom_stepper(context, positaion: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Who are you looking to connect with? Select up to 3 of the following:")),
                        skip_button(
                          context,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const Home_screen();
                            },));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context,dividedBy: 1.75),
                      width: screenWidth(context),
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: lookingFor.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return   custom_selection(context,top: screenHeight(context,dividedBy: 50),text: lookingFor[index], list: _type1, onTap: () {
                            if(_type1.length < 3){
                              setState(() {
                                _type1.contains(lookingFor[index]) ? _type1.remove(lookingFor[index]) :_type1.add(lookingFor[index]);
                              });
                            }else{
                              setState(() {
                                _type1.remove(lookingFor[index]);
                              });
                            }
                          });
                        },),
                    ),
                    Custom_botton(context, text: 'Done', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Home_screen();
                      },));
                    }, height: screenHeight(context,dividedBy: 25))
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0.0,
                child: custom_stepper(context, positaion: ind)),
          ],
        ),
      ),
    );
  }
}
