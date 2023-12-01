import 'package:animate_do/animate_do.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair_me/Screen_Pages/address_details.dart';
import 'package:pair_me/Screen_Pages/business_address.dart';
import 'package:pair_me/Screen_Pages/business_profile.dart';
import 'package:pair_me/Screen_Pages/professional_details.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:table_calendar/table_calendar.dart';

import 'login_page.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _eMail = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _date = TextEditingController();
  String gender = 'Female';
  bool popup = false;
  // bool popup1 = false;
  bool calendar = false;
  // bool calendar1 = false;
  // bool select = false;
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
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: const AssetImage('assets/Images/back.png'),
                              height: screenHeight(context, dividedBy: 45),
                              width: screenHeight(context, dividedBy: 45),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context, dividedBy: 25),
                          ),
                          const Text(
                            'Update Profile',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          height: screenHeight(context, dividedBy: 7),
                          width: screenHeight(context, dividedBy: 7),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeHt2GDofV5sNOaTrLarqU3XmMpTNXxaw9dg&usqp=CAU'),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: Colors.grey),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: screenHeight(context, dividedBy: 150),
                                right: screenWidth(context, dividedBy: 200),
                                child: Container(
                                  height: screenHeight(context, dividedBy: 30),
                                  width: screenHeight(context, dividedBy: 30),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.white),
                                  child: Center(
                                    child: Image(
                                        image: const AssetImage('assets/Images/camera.png'),
                                      height: screenHeight(context, dividedBy: 50),
                                      width: screenHeight(context, dividedBy: 50),
                                      color: AppColor.skyBlue,
                                    ),

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight(context,dividedBy: 50),),
                      custom_textfield_header(text: 'First Name'),
                      Custom_textfield(context, show_icon: false, onPress: () {},  hint: 'Enter your first name', controller: _firstName, hidetext: false, readOnly: false),
                      custom_textfield_header(text: 'Last Name'),
                      Custom_textfield(context, show_icon: false, onPress: () {},  hint: 'Enter your last name', controller: _lastName, hidetext: false, readOnly: false),
                      custom_textfield_header(text: 'Gender'),
                      Custom_textfield(context, show_icon: true, onTap: () {
                        setState(() {
                          popup = !popup;
                        });
                      },onPress: () {
                        setState(() {
                          popup = !popup;
                        });
                      }, image: popup ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', hint: 'Select your Gender', controller: _gender, hidetext: false, readOnly: true),
                      popup ? FadeInDown(
                        animate: true,
                        from: 7,
                        child: Container(
                          height: screenHeight(context,dividedBy: 10),
                          width: screenWidth(context),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(6),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(height: screenHeight(context,dividedBy: 25),child:  Radio(value: "Female", groupValue: gender,activeColor: AppColor.skyBlue,onChanged: (value) {
                                    setState(() {
                                      gender = value!;
                                      _gender.text =gender;
                                      popup = !popup;
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
                                      popup = !popup;
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
                      custom_textfield_header(text: 'Date of birth'),
                      Custom_textfield(context, show_icon: true,onTap:  () {
                        setState(() {
                          calendar = !calendar;
                        });
                      }, image: 'assets/Images/calendar.png',onPress: () {
                        setState(() {
                          calendar = !calendar;
                        });
                      }, hint: 'Select ', controller: _date, hidetext: false,readOnly: true),
                      calendar ? FadeInDown(
                        animate: true,
                        from: 10,
                        child: Container(
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
                              // setState(() {
                              //   calendar = !calendar;
                              // });
                            },
                          ),
                        ),
                      ) :const SizedBox(),
                      custom_textfield_header(text: 'Phone Number'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 75)),
                        // height: screenHeight(context,dividedBy: 15),
                        // width: screenWidth(context,dividedBy: 1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
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
                        child: TextField(
                          controller: _phoneNumber,
                          keyboardType: TextInputType.number,
                          cursorColor: const Color(0xffB3B3B3),
                          style: const TextStyle(fontSize: 13),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                              border: InputBorder.none,
                              //  suffixIcon: const Image(image: AssetImage('assets/Images/unhide.png')),
                              prefixIcon: GestureDetector(
                                onTap:() {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    onSelect: (Country country) {
                                      print('Select country: ${country.phoneCode}');
                                      countryCodeSelect =country.phoneCode;
                                      countryCodeflagsvg = country.flagEmoji;
                                      //flutterToast(country.displayNameNoCountryCode, true);
                                      setState(() {});
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right :screenWidth(context,dividedBy: 25)),
                                  alignment: Alignment.center,
                                  width: screenWidth(context, dividedBy: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300, blurRadius: 1)
                                      ]),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                            width: screenWidth(context, dividedBy: 70)),
                                        Text("$countryCodeflagsvg +$countryCodeSelect",style: const TextStyle(fontSize:12,fontFamily: 'Roboto',fontWeight: FontWeight.w400,color: AppColor.dropdownfont),),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColor.dropdownfont,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: screenWidth(context, dividedBy: 70),
                                        )
                                      ]),
                                ),
                              ),
                              // SvgPicture.asset(
                              //     'assets/Images/hide.svg',height: 10,width: 10,
                              //   //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                              //     //semanticsLabel: 'A red up arrow'
                              // ),
                              hintText: 'Phone Number',
                              hintStyle:  const TextStyle(color: Color(0xffB3B3B3),fontFamily: 'Roboto',fontSize: 12,fontWeight: FontWeight.w400)
                          ),
                        ),
                      ),
                      custom_textfield_header(text: 'E-mail'),
                      Custom_textfield(context, show_icon: false, onPress: () {

                      }, hint: 'Enter your email', controller: _eMail, hidetext: false,readOnly: false),
                      Divider(
                        height: 0,
                      ),
                      SizedBox(height: screenHeight(context,dividedBy: 100),),
                      EditCard(context, Name: 'Address Details', onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return  Address_Details(Name: 'Edit',);
                        },));
                      },),
                      EditCard(context, Name: 'Professional Details', onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Professional_Details(Name: 'Edit',);
                        },));
                      },),
                      EditCard(context, Name: 'Business or Professional Address', onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Business_Address(Name: 'Edit');
                        },));
                      },),
                      EditCard(context, Name: 'Profile', onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Business_Profile(Name: 'Edit',);
                        },));
                      },),
                      Custom_botton(context, text: 'Save', onTap: () {
                        Navigator.pop(context);
                      }, height: screenHeight(context,dividedBy: 30))
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
Widget EditCard (BuildContext context,{required String Name,required Function() onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin:EdgeInsets.only(bottom: screenHeight(context,dividedBy: 90)),
      height: screenHeight(context,dividedBy: 16),
      width: screenWidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
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
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(Name,style: const TextStyle(fontFamily: 'Roboto',fontSize: 15,fontWeight: FontWeight.w500),),
            Container(
              height: screenHeight(context,dividedBy: 50),
              width: screenHeight(context,dividedBy: 50),
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Images/edit.png'))
              ),
            )
          ],
        ),
      ),
    ),
  );
}