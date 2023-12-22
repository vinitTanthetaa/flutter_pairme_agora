import 'package:flutter/material.dart';
import 'package:pair_me/helper/Size_page.dart';

Widget Background_Img (BuildContext context){
  return Positioned(
    top: 0.0,
    right: 0.0,
    child:
    Container(
      height: screenHeight(context,dividedBy: 2.3),
      width: screenWidth(context,dividedBy: 1.9),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/Asset5.png'),fit: BoxFit.contain)
      ),
    ),
  );
}