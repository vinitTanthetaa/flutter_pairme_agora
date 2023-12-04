import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';

Widget custom_header({required String text}) {
  return Text(
    text.tr(),
    style: const TextStyle(
        fontSize: 25,
        color: AppColor.blackHeader,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600),
  );
}

Widget custom_discription({required String text}) {
  return Text(
    text,
    style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        color: AppColor.fontdarkgray),
    maxLines: 2,
  ).tr();
}
Widget custom_textfield_header({required String text,bool header = false}) {
  return header ? RichText(
      textAlign: TextAlign.center,
      maxLines: 2,
      text:  TextSpan(
        children: [
          TextSpan(
            text: text.tr(),
            style: const TextStyle(
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
                color: AppColor.black),
            
          ),
          const TextSpan(text:'*',style: TextStyle(fontSize: 15,color:Color(0xffFF2C2C),fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
          ),
        ],

      )) :  Text(
    text.tr(),
    style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.ellipsis,
        color: AppColor.black),

  );
}

Widget custom_text({required String text, required Color color}) {
  return Text(
    text.tr(),
    style: TextStyle(
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: color),
  );
}
