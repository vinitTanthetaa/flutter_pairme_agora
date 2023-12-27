import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';


abstract class ResetPasswordState {}

class ResetPasswordInitials extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitials());

  Future<void> ResetPasswordService(
      {required String phoneNumber,
        required String password,
        required String confirmPassword,
        required BuildContext context}) async {
    emit(ResetPasswordLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "phoneNumber": phoneNumber,
      "password": password,
      "confirmPassword": confirmPassword,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.reset_password, data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200) {
        print("Response ===> ${response.data}");
        emit(ResetPasswordSuccess());
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Login_page();
        },));
        flutterToast(hello['message'], true);
      } else {
        emit(ResetPasswordError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ResetPasswordError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}
//ResetPassword Successfully