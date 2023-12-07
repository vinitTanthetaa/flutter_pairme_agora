import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

Widget Custom_textfield(BuildContext context,
    {required bool show_icon,
    int? mxline,
    required bool readOnly,
    Function()? onPress,
    Function()? onTap,
      bool number = false,
    String? image,
    required String hint,
    required bool hidetext,
    required TextEditingController controller}) {
  return Container(
    margin:
        EdgeInsets.symmetric(vertical: screenHeight(context, dividedBy: 75)),
     height: screenHeight(context,dividedBy: 20),
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
    child: Padding(
      padding: EdgeInsets.only(
          left: screenWidth(context, dividedBy: 25),
          bottom: screenHeight(context,dividedBy: 150),
          right: show_icon ? 0 : screenWidth(context, dividedBy: 25)),
      child: TextField(
        onTap: onTap,
        maxLines: mxline ?? 1,
        minLines: 1,
        readOnly: readOnly,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        controller: controller,
        cursorColor: const Color(0xffB3B3B3),
        style: const TextStyle(fontSize: 13),
        textInputAction: TextInputAction.next,
        obscureText: show_icon ? hidetext : false,
        decoration: show_icon
            ? InputDecoration(
                // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                border: InputBorder.none,
                //  suffixIcon: const Image(image: AssetImage('assets/Images/unhide.png')),
                suffixIcon: IconButton(
                  splashRadius: 1,
                  style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    onPress!();
                  },
                  icon: Container(
                    height: screenHeight(context, dividedBy: 30),
                    width: screenWidth(context, dividedBy: 20),
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(image!))),
                  ),
                ),
                // SvgPicture.asset(
                //     'assets/Images/hide.svg',height: 10,width: 10,
                //   //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                //     //semanticsLabel: 'A red up arrow'
                // ),
                hintText: hint.tr(),
                hintStyle: const TextStyle(
                    color: Color(0xffB3B3B3),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400))
            : InputDecoration(
                // contentPadding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                border: InputBorder.none,
                hintText: hint.tr(),
                hintStyle: const TextStyle(
                    color: Color(0xffB3B3B3),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
      ),
    ),
  );
}
