
import 'package:flutter/material.dart';

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1.0}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1.0}) {
  return screenSize(context).width / dividedBy;
}

int selectedStep = 0;
bool showcase = true;
int showcasetime = 0;
String Authtoken = '';
String fcmtoken = '';
String AgoraAppid = '71acb4aa29c343b99145d14ecbe23c1f';
String AgoraAppkey = '611031492#1280036';
String Language = 'english';