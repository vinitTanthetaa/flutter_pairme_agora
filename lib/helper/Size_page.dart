
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
String AgoraAppid = '08317f6ee1cb4b50825e1e572c307f62';
String AgoraAppkey = '611031492#1211760';