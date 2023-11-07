import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/address_details.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/Size_page.dart';

class Set_Password extends StatefulWidget {
  const Set_Password({super.key});

  @override
  State<Set_Password> createState() => _Set_PasswordState();
}

class _Set_PasswordState extends State<Set_Password> {
  final TextEditingController _Password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
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
                  custom_header(text: "Set your password"),
                  custom_discription(text: "Please enter the details below to continue"),
                  SizedBox(height: screenHeight(context,dividedBy: 50),),
                  custom_textfield_header(text: 'Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  }, image: hidePassword == false ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png', hint: 'Enter your password', controller: _Password, hidetext: hidePassword, readOnly: false),
                  custom_textfield_header(text: 'Confirm Password'),
                  Custom_textfield(context, show_icon: true, onPress: () {
                    setState(() {
                      hideconfirmPassword = !hideconfirmPassword;
                    });
                  },  hint: 'Enter your Confirm password', image: hideconfirmPassword == false ? 'assets/Images/visibility_off.png': 'assets/Images/visibility.png',controller: _confirmPassword, hidetext: hideconfirmPassword, readOnly: false),
                  const Spacer(),
                  Custom_botton(context, text: 'Save', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return  Verification_code(Forggot: false,);
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
