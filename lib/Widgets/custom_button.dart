import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

Widget Custom_botton (BuildContext context ,{required String text,required Function() onTap,required double height}){
  return InkWell(
    overlayColor: MaterialStatePropertyAll(Colors.white),
    onTap: onTap,
    child: Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:screenWidth(context,dividedBy: 10),vertical: height),
        alignment: Alignment.center,
        height: screenHeight(context,dividedBy: 17),
        width: text.length <=12 ? screenWidth(context,dividedBy: 2.5) : screenWidth(context,dividedBy: 1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(colors: [AppColor.skyBlue,AppColor.whiteskyBlue]),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color(0xff7A7A7A),
          //     offset: Offset(
          //       0,
          //       4,
          //     ),
          //     blurRadius: 11,
          //      spreadRadius: 0.0,
          //   ),
          // ]
        ),
        child: Text(text.tr(),style:  const TextStyle(fontWeight: FontWeight.w600,fontSize: 17,fontFamily: 'Roboto',color: AppColor.white),),
      ),
    ),
  );
}

Widget skip_button (BuildContext context,{required Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: ShaderMask(blendMode: BlendMode.srcIn,shaderCallback: (bounds) {
      return const LinearGradient(colors: [AppColor.skyBlue, AppColor.whiteskyBlue]).createShader(bounds);
    },child: Text("Skip".tr()),),
  );
}

