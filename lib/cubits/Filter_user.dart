import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Modal/alluserprofile.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:pair_me/helper/pref_Service.dart';

import '../Modal/filter_user_data.dart';


abstract class FilterUserState {}

class FilterUserInitials extends FilterUserState {}

class FilterUserLoading extends FilterUserState {}

class FilterUserError extends FilterUserState {}

class FilterUserSuccess extends FilterUserState {}

class FilterUserCubit extends Cubit<FilterUserState> {
  FilterUserCubit() : super(FilterUserInitials());
  SharedPrefsService prefsService = SharedPrefsService();
  FilterUser filterUser = FilterUser();
  Future<FilterUser?> FilterUserService(
      {  String? distance,
         String? country,
         String? state,
         String? city,
         String? gender,
         List? looking_for,
         BuildContext? context}) async {
    emit(FilterUserLoading());
    Map<String, dynamic> body = {
      "distance": distance,
      "gender": gender  ,
      "looking_for": looking_for ,
      "country":country,
      "city": city,
      "state": state,
    };
    // Map<String, dynamic> body = {};
    // distance != null ? body['distance'] = distance : body = body;
    // country != null ? body['country'] = country : body = body;
    // state != null ? body['state'] = state : body = body;
    // city != null ? body['city'] = city : body = body;
    // gender != null ? body['gender'] = gender : body = body;
    // looking_for != null ? body['looking_for'] = looking_for : body = body;
    final dio = Dio();
    print("Body is $body");
    try {
      final response = await dio.post(apis.filter,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      log("response : $response");
      final hello = response.data;
      if (hello['code'] == 200) {
        filterUser = FilterUser.fromJson(response.data);
        log("Response ===> ${response.data}");
        int ind = filterUser.data?.length ?? 0;
        if(ind >= 1){
          log("filter ===> true");
          prefsService.setBoolData("filter", true);
          emit(FilterUserSuccess());
        } else {
          flutterToast("No User Found!", false);
          log("filter ===> true");
          prefsService.setBoolData("filter", false);
          emit(FilterUserError());
        }
       // flutterToast(hello['message'], true);
      } else {
        emit(FilterUserError());
        flutterToast("No User Found!", false);
        log("filter ===> true");
        prefsService.setBoolData("filter", false);
       // flutterToast(hello['message'], false);
      }
      return filterUser;
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(FilterUserError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}