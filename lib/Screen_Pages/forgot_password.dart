import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/Size_page.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  final TextEditingController _Email = TextEditingController();
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
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight(context,dividedBy: 10),),
                  custom_header(text: "Forgot Password"),
                  custom_discription(text: "Enter the E-mail associated with your account"),
                  SizedBox(height: screenHeight(context,dividedBy: 50),),
                  custom_textfield_header(text: 'E-mail'),
                  Custom_textfield(context, show_icon: false, onPress: () {

                  },  hint: 'Enter your email', controller: _Email, hidetext: false, readOnly: false),
                  const Spacer(),
                  Custom_botton(context, text: 'Send', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Verification_code(Forggot: true, Number: '',);
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
