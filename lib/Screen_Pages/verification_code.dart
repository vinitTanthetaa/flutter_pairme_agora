import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/address_details.dart';
import 'package:pair_me/Screen_Pages/creat_new_password.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pinput/pinput.dart';

class Verification_code extends StatefulWidget {
  bool Forggot;
  Verification_code({super.key,required this.Forggot});

  @override
  State<Verification_code> createState() => _Verification_codeState();
}

class _Verification_codeState extends State<Verification_code> {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: screenHeight(context, dividedBy: 14.5                                                                                                                                            ),
      height: screenHeight(context, dividedBy: 13),
      textStyle: const TextStyle(
          fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1.0, 2.0),
                color: Colors.grey.shade300,
                blurRadius: 4)
          ]),
    );
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight(context,dividedBy: 10),),
                custom_header(text: "Verification Code"),
                custom_discription(text: "Please enter the code we sent to your phone"),
                SizedBox(height: screenHeight(context,dividedBy: 50),),
                Container(
                    padding: EdgeInsets.only(right: screenWidth(context, dividedBy: 10)),
                    width: screenWidth(context, dividedBy: 1.1),
                    child: Pinput(
                      length: 4,
                      controller: pinController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      keyboardType: TextInputType.numberWithOptions(),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      showCursor: true,
                      onCompleted: (pin) => print(pin),
                    )),
                SizedBox(height: screenHeight(context,dividedBy: 70),),
                const Text('Resend Code',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: AppColor.skyBlue,decoration: TextDecoration.underline,decorationColor: AppColor.skyBlue,decorationStyle: TextDecorationStyle.solid,decorationThickness: 1.5)),
                const Spacer(),
                Custom_botton(context, text: 'Verify', onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return widget.Forggot ? Create_New_Password() : Address_Details(Name: '',);
                  },));
                }, height: screenHeight(context,dividedBy: 20),)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
