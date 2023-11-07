import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pair_me/helper/App_Colors.dart';

void flutterToast(String text, bool isBottom) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: isBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
      timeInSecForIosWeb:text ==
          'Please wait, It can take up to a minute depending on contacts'?14: 2,
      backgroundColor: isBottom ||
          text ==
              'Please wait, It can take up to a minute depending on contacts'
          ? AppColor.whiteskyBlue
          : Colors.orangeAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}