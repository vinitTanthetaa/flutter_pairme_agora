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
    Function(String)? onChanged,
    Function()? onTap,
    bool number = false,
    String? image,
    required String hint,
    required bool hidetext,
    required TextEditingController controller}) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(
        bottom: screenHeight(context, dividedBy: 70),
        top: screenHeight(context, dividedBy: 100)),
    height: screenHeight(context, dividedBy: 20),
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
    child: Center(
      child: Padding(
        padding: show_icon ? EdgeInsets.only(left: 15.0,top: screenHeight(context,dividedBy: 200)) : EdgeInsets.only(left: 15.0,bottom: screenHeight(context,dividedBy: 200)),
        child: TextField(
          onTap: onTap,
          onChanged: onChanged,
          enabled: true,
          maxLines: mxline ?? 1,
          minLines: 1,
          readOnly: readOnly,
          keyboardType: number ? TextInputType.number : TextInputType.text,
          controller: controller,
          cursorColor: const Color(0xffB3B3B3),
          style: const TextStyle(fontSize: 14),
          textInputAction: TextInputAction.next,
          obscureText: show_icon ? hidetext : false,
          decoration: show_icon
              ? InputDecoration(
                  border: InputBorder.none,
                 contentPadding: EdgeInsets.zero,
                  suffixIcon: IconButton(
                      splashRadius: 1,
                      style: const ButtonStyle(
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      onPressed: () {
                        onPress!();
                      },
                      icon: Image(
                        image: AssetImage(image!),
                        height: screenHeight(context, dividedBy: 40),
                        width: screenHeight(context, dividedBy: 40),
                      )),
                  hintText: hint.tr(),
                  hintStyle: const TextStyle(
                      color: Color(0xffB3B3B3),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400))
              : InputDecoration(
                  border: InputBorder.none,
             //isCollapsed: true,
              isDense: true,
                  hintText: hint.tr(),
              contentPadding: EdgeInsets.zero,
                  hintStyle: const TextStyle(
                      color: Color(0xffB3B3B3),
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
        ),
      ),
    ),
  );
}
