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


abstract class FilterUserState {}

class FilterUserInitials extends FilterUserState {}

class FilterUserLoading extends FilterUserState {}

class FilterUserError extends FilterUserState {}

class FilterUserSuccess extends FilterUserState {}

class FilterUserCubit extends Cubit<FilterUserState> {
  FilterUserCubit() : super(FilterUserInitials());

  Future<void> FilterUserService(
      { String? distance,
         String? country,
         String? state,
         String? city,
         String? gender,
         List? looking_for,
        required BuildContext context}) async {
    emit(FilterUserLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
       "distance": distance,
      "gender": gender  ,
      "looking_for": looking_for ,
       "country":country,
       "city": city,
       "state": state,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.filter,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "FilterUser Successfully") {
        print("Response ===> ${response.data}");
        emit(FilterUserSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(FilterUserError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(FilterUserError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}