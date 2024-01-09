import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pair_me/helper/App_Colors.dart';

Widget customLoader (){
  return const SpinKitSpinningLines(
    color: AppColor.skyBlue,
    size: 50.0,
  );
}