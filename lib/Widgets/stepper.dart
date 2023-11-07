import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:steps_indicator/steps_indicator.dart';

Widget custom_stepper ( BuildContext context,{required int positaion}){
  return Padding(
    padding:  EdgeInsets.only(top: screenHeight(context,dividedBy: 20),bottom: screenHeight(context,dividedBy: 30)),
    child: StepsIndicator(
      selectedStep: positaion,
      nbSteps: 6,
      doneLineColor: AppColor.skyBlue,
      doneStepColor: AppColor.skyBlue,
      undoneLineColor: AppColor.gray,
      lineLength: screenWidth(context,dividedBy: 9.5),
      doneLineThickness: 7,
      undoneLineThickness: 7,
      unselectedStepWidget:const CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage('assets/Images/stepper.png'),
      ) ,
      doneStepWidget: const CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage('assets/Images/stepper.png'),
      ),
      selectedStepWidget: const CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage('assets/Images/stepper.png'),
      ),
      // lineLengthCustomStep: [
      //   StepsIndicatorCustomLine(nbStep: 4, length: 105)
      // ],
      enableLineAnimation: true,
      enableStepAnimation: true,
    ),
  );
}