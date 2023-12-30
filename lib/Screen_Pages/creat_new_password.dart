import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/cubits/Reset_Password.dart';
import 'package:pair_me/helper/Size_page.dart';

class Create_New_Password extends StatefulWidget {
  String Phonenumber;
  Create_New_Password({super.key,required this.Phonenumber});

  @override
  State<Create_New_Password> createState() => _Create_New_PasswordState();
}

class _Create_New_PasswordState extends State<Create_New_Password> {
  ResetPasswordCubit resetPasswordCubit = ResetPasswordCubit();
  final TextEditingController  _Password = TextEditingController();
  final TextEditingController  _confirmPassword = TextEditingController();
  bool hidePassword = false;
  bool hideconfirmPassword = false;
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
                  SizedBox(height: screenHeight(context,dividedBy: 10),),
                  custom_header(text: "Create New Password"),
                  custom_discription(text: "Your new password cannot be the same as a previous password"),
                  SizedBox(height: screenHeight(context,dividedBy: 50),),
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
                  Custom_botton(context, text: 'Save', onTap: () {
                   // resetPasswordCubit.ResetPasswordService(phoneNumber: widget.Phonenumber, password: _Password.text, confirmPassword: _confirmPassword.text, context: context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const Login_page();
                    },));
                  }, height: screenHeight(context,dividedBy: 20),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
