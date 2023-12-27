import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/Step_Screens.dart';
import 'package:pair_me/Screen_Pages/creat_new_password.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';


abstract class VerifyForgotOtpState {}

class VerifyForgotOtpInitials extends VerifyForgotOtpState {}

class VerifyForgotOtpLoading extends VerifyForgotOtpState {}

class VerifyForgotOtpError extends VerifyForgotOtpState {}

class VerifyForgotOtpSuccess extends VerifyForgotOtpState {}

class VerifyForgotOtpCubit extends Cubit<VerifyForgotOtpState> {
  VerifyForgotOtpCubit() : super(VerifyForgotOtpInitials());

  Future<void> VerifyForgotOtpService(
      {required String phoneNumber,
        required String otp,
        required bool forget,
        required BuildContext context}) async {
    emit(VerifyForgotOtpLoading());
    final dio = Dio();
    SharedPrefsService prefsService = SharedPrefsService();
    Map<String, dynamic> body = {
      "phoneNumber": phoneNumber,
      "OTP": otp,
    };
    // print("Body is $body");
    try {
      Response response = await dio.post(apis.verify_forgot_otp, data: jsonEncode(body));
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200) {
        print("Response ===> ${response.data}");
        emit(VerifyForgotOtpSuccess());
        Authtoken = "Bearer ${hello['Token']}";
        prefsService.setStringData("Authtoken", Authtoken);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return forget ? Create_New_Password(Phonenumber: phoneNumber,) : const StepScreen();
        },));
        flutterToast(hello['message'], true);
      } else {
        emit(VerifyForgotOtpError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> $e");
      emit(VerifyForgotOtpError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}