import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ChangePasswordState {}

class ChangePasswordInitials extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {}

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitials());

  Future<void> ChangePasswordService(
      {required String currentPassword,
        required String newPassword,
        required String confirmPassword,
        required BuildContext context}) async {
    emit(ChangePasswordLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "currentPassword": currentPassword,
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.change_password,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200 && hello['message'] == "Password is updated") {
        print("Response ===> ${response.data}");
        emit(ChangePasswordSuccess());
        flutterToast(hello['message'], true);
        Navigator.pop(context);
      } else {
        emit(ChangePasswordError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ChangePasswordError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}