import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/business_address.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:steps_indicator/steps_indicator.dart';

class Professional_Details extends StatefulWidget {
  String Name;
  Professional_Details({super.key,required this.Name});

  @override
  State<Professional_Details> createState() => _Professional_DetailsState();
}

class _Professional_DetailsState extends State<Professional_Details> {
  final TextEditingController _compnyName = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _compnyDomain = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _categorycontroller = TextEditingController();
  final TextEditingController _experiencecontroller = TextEditingController();
  final TextEditingController _skillcontroller = TextEditingController();
  final TextEditingController _educationcontroller = TextEditingController();
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
  bool _category = false;
  bool _experience = false;
  bool _skill = false;
  bool _education = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.Name == 'Edit' ?    SizedBox(height: screenHeight(context,dividedBy: 15),) : custom_stepper(context, positaion: 2),
                    widget.Name == 'Edit' ? custom_header(text: "Professional Details") :Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: custom_header(text: "Professional Details")),
                        skip_button(context, onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return  Business_Address(Name: '',);
                          },));
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
                        text: widget.Name == 'Edit'? 'SAVE':'Next',
                        onTap: () {
                          if(widget.Name == 'Edit'){
                            Navigator.pop(context);
                          } else {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  Business_Address(Name: '',);
                            },));
                          }
                        }, height: screenHeight(context,dividedBy: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
