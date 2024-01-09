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


abstract class VerifyState {}

class VerifyInitials extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifyError extends VerifyState {}

class VerifySuccess extends VerifyState {}

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitials());

  Future<void> VerifyService(
      {required String phoneNumber,
        required String otp,
        required bool forget,
        required BuildContext context}) async {
    emit(VerifyLoading());
    final dio = Dio();
    SharedPrefsService prefsService = SharedPrefsService();
    Map<String, dynamic> body = {
      "phoneNumber": phoneNumber,
      "otp": otp,
    };
   // print("Body is $body");
    try {
      Response response = await dio.post(apis.verify, data: jsonEncode(body));
      final hello = response.data;
      print(hello);
      if (hello['message'] == 'Otp Verified.') {
        print("Response ===> ${response.data}");
        emit(VerifySuccess());
        Authtoken = "Bearer ${hello['Token']}";
        prefsService.setStringData("Authtoken", Authtoken);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const StepScreen();
        },));
        flutterToast(hello['message'], true);
      } else {
        emit(VerifyError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> $e");
      emit(VerifyError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}