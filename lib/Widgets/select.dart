import 'package:flutter/material.dart';
import 'package:pair_me/helper/Size_page.dart';

Widget custom_selection (BuildContext context,{required String text,required List list,double? top,double? bottom,required Function() onTap}){
  return Padding(
    padding: EdgeInsets.only(bottom: bottom ?? 0 ,top: top ?? 0),
    child: Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: screenHeight(context,dividedBy: 45),
            width: screenHeight(context,dividedBy: 45),
            color:  const Color(0xffD4E2FF),
            child: Center(
              child: list.contains(text) ? Container(
                height: screenHeight(context,dividedBy: 65),
                width: screenHeight(context,dividedBy: 65),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                    image: const DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                ),
              ) : const SizedBox(),
            ),
          ),
        ),
        SizedBox(width: screenWidth(context,dividedBy: 50),),
        Text(text,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Roboto',color: list.contains(text) ? const Color(0xff303030) : const Color(0xffB3B3B3)),)
      ],
    ),
  );
}