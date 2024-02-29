import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';


abstract class ForgotPasswordState {}

class ForgotPasswordInitials extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordError extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitials());

  Future<void> ForgotPasswordService(
      {required String phoneNumber,
        required BuildContext context}) async {
    emit(ForgotPasswordLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "phoneNumber": phoneNumber,
      "countryCode": countryCodeSelect,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.forgotpassword, data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200) {
        print("Response ===> ${response.data}");
        emit(ForgotPasswordSuccess());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  Verification_code(Forggot: true, Number: phoneNumber,);
        },));
       // flutterToast(hello['message'], true);
      } else {
        emit(ForgotPasswordError());
        //flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ForgotPasswordError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}