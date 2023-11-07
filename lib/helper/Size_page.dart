
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
int nbSteps = 7;
bool showcase = true;