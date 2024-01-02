import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Screen_Pages/Step_Screens.dart';
import 'package:pair_me/Screen_Pages/address_details.dart';
import 'package:pair_me/Screen_Pages/creat_new_password.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/cubits/ReSend_Otp_cubit.dart';
import 'package:pair_me/cubits/Verify.dart';
import 'package:pair_me/cubits/verify_forgot_otp.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pinput/pinput.dart';

class Verification_code extends StatefulWidget {
  String Number;
  bool Forggot;
  Verification_code({super.key,required this.Forggot,required this.Number});

  @override
  State<Verification_code> createState() => _Verification_codeState();
}

class _Verification_codeState extends State<Verification_code> {
  final pinController = TextEditingController();
  VerifyCubit verifyCubit = VerifyCubit();
  ResendOtpCubit resendOtpCubit = ResendOtpCubit();
  VerifyForgotOtpCubit verifyForgotOtpCubit = VerifyForgotOtpCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyCubit = BlocProvider.of<VerifyCubit>(context);
    resendOtpCubit = BlocProvider.of<ResendOtpCubit>(context);
    verifyForgotOtpCubit = BlocProvider.of<VerifyForgotOtpCubit>(context);
  }
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
                custom_discription(text: "counter2"),
                SizedBox(height: screenHeight(context,dividedBy: 50),),
                Container(
                    padding: EdgeInsets.only(right: screenWidth(context, dividedBy: 10)),
                    width: screenWidth(context, dividedBy: 1.1),
                    child: Pinput(
                      length: 4,
                      controller: pinController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      keyboardType: const TextInputType.numberWithOptions(),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      showCursor: true,
                      onCompleted: (pin) {
                        pinController.text = pin;
                      },
                    )),
                SizedBox(height: screenHeight(context,dividedBy: 70),),
                InkWell(
                  onTap: () {
                   // resendOtpCubit.ResendOtpService(phoneNumber: widget.Number, context: context);
                  },
                    child: Text('Resend Code'.tr(),style: const TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: AppColor.skyBlue,decoration: TextDecoration.underline,decorationColor: AppColor.skyBlue,decorationStyle: TextDecorationStyle.solid,decorationThickness: 1.5))),
                const Spacer(),
                Custom_botton(context, text: 'Verify',
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return widget.Forggot ? Create_New_Password(Phonenumber: '',) : const StepScreen();
                //   },));
                // },
                  onTap: () {
                  if(pinController.text.isEmpty){
                    flutterToast("Plese Enter Pin", true);
                  } else if(widget.Forggot){
                    verifyForgotOtpCubit.VerifyForgotOtpService(phoneNumber: widget.Number, otp: pinController.text, forget: true, context: context);
                  } else {
                    verifyCubit.VerifyService(phoneNumber: widget.Number, otp: pinController.text, forget: false, context: context);
                  }
                },
                  height: screenHeight(context,dividedBy: 20),)
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
