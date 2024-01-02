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


abstract class UserUpdateState {}

class UserUpdateInitials extends UserUpdateState {}

class UserUpdateLoading extends UserUpdateState {}

class UserUpdateError extends UserUpdateState {}

class UserUpdateSuccess extends UserUpdateState {}

class UserUpdateCubit extends Cubit<UserUpdateState> {
  UserUpdateCubit() : super(UserUpdateInitials());

  Future<void> UserUpdateService(
      {required String firstname,
      required String lastname,
        required String gendar,
        required String dateofbirth,
        required String phonenumber,
        required String email,
        required BuildContext context}) async {
    emit(UserUpdateLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "firstName": firstname,
      "lastName": lastname,
      "gender": gendar,
      "dateOfBirth": dateofbirth,
      "phoneNumber":phonenumber,
      "email": email,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.userupdate,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "UserUpdate Successfully") {
        print("Response ===> ${response.data}");
        emit(UserUpdateSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(UserUpdateError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(UserUpdateError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}