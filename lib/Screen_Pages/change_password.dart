import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/Size_page.dart';

import '../helper/App_Colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController  _Password = TextEditingController();
  final TextEditingController  _confirmPassword = TextEditingController();
  final TextEditingController  _oldPassword = TextEditingController();
  bool hidePassword = false;
  bool hideconfirmPassword = false;
  bool hideoldPassword = false;
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context,dividedBy: 15),),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: const AssetImage('assets/Images/back.png'),
                            height: screenHeight(context,dividedBy: 60),
                            width: screenHeight(context,dividedBy: 60),
                          ),
                        ),
                        SizedBox(width: screenWidth(context,dividedBy: 60),),
                        Text('Back')
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight(context,dividedBy: 55),),
                  custom_header(text: 'Change Password'),
                  custom_discription(text: "Your new password cannot be the same as a previous password"),
                  SizedBox(height: screenHeight(context,dividedBy: 50),),
                  // custom_textfield_header(text: 'User ID'),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Text(
                  //     'Jane Koblenz',
                  //     style: const TextStyle(
                  //         fontSize: 15,
                  //         fontFamily: 'Roboto',
                  //         fontWeight: FontWeight.w500,
                  //         overflow: TextOverflow.ellipsis,
                  //         color: AppColor.fontdarkgray),
                  //     maxLines: 2,
                  //   ),
                  // ),
                  // SizedBox(height: screenHeight(context,dividedBy: 50),),
                  custom_textfield_header(text: 'Old Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hideoldPassword = !hideoldPassword;
                    });
                  }, image: hideoldPassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png', hint: 'Enter your old password', controller: _oldPassword, hidetext: hideoldPassword, readOnly: false),
                  custom_textfield_header(text: 'Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  }, image: hidePassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png', hint: 'Enter your password', controller: _Password, hidetext: hidePassword, readOnly: false),
                  custom_textfield_header(text: 'Confirm Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hideconfirmPassword = !hideconfirmPassword;
                    });
                  },  hint: 'Enter your Confirm password', image: hideconfirmPassword  ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png',controller: _confirmPassword, hidetext: hideconfirmPassword, readOnly: false),
                  Spacer(),
                  Custom_botton(context, text: 'Update Password', onTap: () {
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Login_page();
                    // },));
                  }, height: screenHeight(context,dividedBy: 15),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
