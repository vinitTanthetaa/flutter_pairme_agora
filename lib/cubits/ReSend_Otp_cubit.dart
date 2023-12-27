import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';


abstract class ResendOtpState {}

class ResendOtpInitials extends ResendOtpState {}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpError extends ResendOtpState {}

class ResendOtpSuccess extends ResendOtpState {}

class ResendOtpCubit extends Cubit<ResendOtpState> {
  ResendOtpCubit() : super(ResendOtpInitials());

  Future<void> ResendOtpService(
      {required String phoneNumber,
        required BuildContext context}) async {
    emit(ResendOtpLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "phoneNumber": phoneNumber,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.resendOtp, data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200) {
        print("Response ===> ${response.data}");
        emit(ResendOtpSuccess());

        flutterToast(hello['message'], true);
      } else {
        emit(ResendOtpError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ResendOtpError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}