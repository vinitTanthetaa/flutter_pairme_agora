import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/cubits/forggot_password.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  ForgotPasswordCubit forgotPasswordCubit = ForgotPasswordCubit();
  final TextEditingController _Email = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);
  }
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
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight(context, dividedBy: 10),
                  ),
                  custom_header(text: "Forgot Password"),
                  custom_discription(
                      text: "Enter the Number associated with your account"),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 50),
                  ),
                  custom_textfield_header(text: 'Phone Number'),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: screenHeight(context, dividedBy: 75)),
                    height: screenHeight(context, dividedBy: 20),
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
                        ]),
                    child: TextField(
                      controller: _Email,
                      keyboardType: TextInputType.number,
                      cursorColor: const Color(0xffB3B3B3),
                      style: const TextStyle(fontSize: 14),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                          border: InputBorder.none,
                          //  suffixIcon: const Image(image: AssetImage('assets/Images/unhide.png')),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) {
                                  print('Select country: ${country.phoneCode}');
                                  countryCodeSelect = country.phoneCode;
                                 // countryCodeflagsvg = country.flagEmoji;
                                  //flutterToast(country.displayNameNoCountryCode, true);
                                  setState(() {});
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: screenWidth(context, dividedBy: 25)),
                              alignment: Alignment.center,
                              width: screenWidth(context, dividedBy: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 1)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                        width: screenWidth(context,
                                            dividedBy: 70)),
                                    Text(
                                      "+$countryCodeSelect",
                                      style: TextStyle(
                                          fontSize:
                                              countryCodeSelect.length <= 3
                                                  ? 13
                                                  : 14,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.dropdownfont),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColor.dropdownfont,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width:
                                          screenWidth(context, dividedBy: 70),
                                    )
                                  ]),
                            ),
                          ),
                          // SvgPicture.asset(
                          //     'assets/Images/hide.svg',height: 10,width: 10,
                          //   //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                          //     //semanticsLabel: 'A red up arrow'
                          // ),
                          hintText: 'Phone Number'.tr(),
                          hintStyle: const TextStyle(
                              color: Color(0xffB3B3B3),
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const Spacer(),
                  Custom_botton(
                    context,
                    text: 'Send',
                    onTap: () {
                      //forgotPasswordCubit.ForgotPasswordService(phoneNumber: _Email.text, context: context);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Verification_code(
                            Forggot: true,
                            Number: '',
                          );
                        },
                      ));
                    },
                    height: screenHeight(context, dividedBy: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
