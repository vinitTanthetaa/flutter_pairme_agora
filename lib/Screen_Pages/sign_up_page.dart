import 'package:animate_do/animate_do.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/set_password_page.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:table_calendar/table_calendar.dart';

class SignUp_page extends StatefulWidget {
  const SignUp_page({super.key});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _eMail = TextEditingController();
    final TextEditingController _gender = TextEditingController();
  final TextEditingController _date = TextEditingController();
  String gender = '';
  bool popup = false;
  bool popup1 = false;
  bool calendar = false;
  bool calendar1 = false;
  bool select = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SingleChildScrollView(
              physics:ClampingScrollPhysics(),
              child: Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context,dividedBy: 10),),
                  custom_header(text: "Sign Up"),
                  custom_discription(text: "counter1"),
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
                  custom_textfield_header(text: 'Date of Birth'),
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
                    margin: EdgeInsets.only(bottom: 10),
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
                      calendarStyle: CalendarStyle(
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            select = !select;
                          });
                        },
                        child: Container(
                          height: screenHeight(context,dividedBy: 45),
                          width: screenHeight(context,dividedBy: 45),
                          color: const Color(0xffD4E2FF),
                          child: Center(
                            child: select ? Container(
                              height: screenHeight(context,dividedBy: 65),
                              width: screenHeight(context,dividedBy: 65),
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: const DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                              ),
                            ) : const SizedBox(),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth(context,dividedBy: 50),),
                      Text('Agree to our EULA / T&Cs',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Roboto',color: select ? Color(0xff303030) : Color(0xffB3B3B3)),)
                    ],
                  ),
                  SizedBox(height: screenHeight(context,dividedBy: 25),),
                  Center(
                    child: Custom_botton(context, text: 'Next', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Set_Password();
                      },));
                    }, height: screenHeight(context,dividedBy: 570),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:screenHeight(context,dividedBy: 35) ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account? ",style: TextStyle(color: Color(0xff888888),fontSize: 15  ,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),
                        InkWell(onTap: () {
                          Navigator.pop(context);
                        },
                            child: const Text("Log In",style: TextStyle(color: Color(0xff231F20),fontSize: 15  ,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)),
                      ],),
                  )
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
