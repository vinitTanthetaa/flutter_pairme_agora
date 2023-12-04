import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/home_screen.dart';
import 'package:pair_me/Screen_Pages/forgot_password.dart';
import 'package:pair_me/Screen_Pages/sign_up_page.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

String countryCodeSelect = '1';
String countryCodeflagsvg = '🇺🇸';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool showpassword = false;
  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Background_Img(context),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy: 10),),
                    custom_header(text: "Login"),
                    custom_discription(text: "counter1"),
                    SizedBox(height: screenHeight(context,dividedBy: 50),),
                    custom_textfield_header(text: 'E-mail'),
                    Custom_textfield(context, show_icon: false, onPress: () {

                    }, image: 'assets/Images/visibility.png', hint: 'Enter your email', controller: _Email, hidetext: showpassword, readOnly: false),
                    custom_textfield_header(text: 'Password'),
                    Custom_textfield(context, show_icon: true, onPress: () {
                        setState(() {
                          showpassword = !showpassword;
                          print('show_Password :$_Password');
                        });
                      }, image: showpassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png', hint: 'Enter your password', controller: _Password, hidetext: showpassword, readOnly: false),
                    Padding(
                        padding: EdgeInsets.only(
                            top: screenWidth(context,
                                dividedBy: 90)),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const Forget_Password();
                                  },));
                                },
                                child: Text('Forgot Password?'.tr(),style: TextStyle(fontFamily: 'Roboto',fontSize: 13,fontWeight: FontWeight.w500,color: Color(0xff437DFF)) ,),
                              ),
                            ]),
                      ),
                    Center(
                      child: Custom_botton(context, text: 'Login', onTap: () {
                        if(_Email.text.isEmpty){
                          flutterToast('Please Enter Email', false);
                        } else if(_Password.text.isEmpty) {
                          flutterToast('Please Enter Password', false);
                        } else {
                          Navigator.push(context,MaterialPageRoute(builder:(context) {
                            return const Home_screen();
                          }, ));
                        }
                      }, height: screenHeight(context,dividedBy: 13),),
                    ),
                    Row(children: <Widget>[
                        Expanded(
                          child:  Container(
                              margin: const EdgeInsets.only(left: 30.0, right: 20.0),
                              child: const Divider(
                                color: Color(0xff888888),
                                height: 36,
                              )),
                        ),
                        const Text("OR",style: TextStyle(color: Color(0xff888888),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),
                        Expanded(
                          child:  Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 30.0),
                              child: const Divider(
                                color: Color(0xff888888),
                                height: 36,
                              )),
                        ),
                      ]),
                    Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 60)),
                          height: screenHeight(context,dividedBy: 17),
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(9),
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
                            padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 4.5)),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: screenHeight(context,dividedBy: 40),
                                  width: screenHeight(context,dividedBy: 40),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/Images/google.png'))),
                                ),

                                const Text("Login with Google",style: TextStyle(color: Color(0xff888888),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    Center(
                        child: Container(
                          height: screenHeight(context,dividedBy: 17),
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(9),
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
                            padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 4.6)),
                            child: Row(
                             // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  height: screenHeight(context,dividedBy: 35),
                                  width: screenHeight(context,dividedBy: 40),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(image: AssetImage('assets/Images/facebook.png'),fit: BoxFit.contain)),
                                ),
                                const Text("Login with Facebook",style: TextStyle(color: Color(0xff888888),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),

                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:screenHeight(context,dividedBy: 25) ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don’t have an account? ",style: TextStyle(color: Color(0xff888888),fontSize: 15  ,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),
                          InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const SignUp_page();
                            },));
                          },
                              child: const Text("Sign Up",style: TextStyle(color: Color(0xff231F20),fontSize: 15  ,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)),
                      ],),
                    )
                  ],),
              ),
            ),
          ],
        )

      ),
    );
  }
}
