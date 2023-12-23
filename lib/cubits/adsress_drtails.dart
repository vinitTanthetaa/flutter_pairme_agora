import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/login_page.dart';
import 'package:pair_me/Screen_Pages/verification_code.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';


abstract class AdressDetailsState {}

class AdressDetailsInitials extends AdressDetailsState {}

class AdressDetailsLoading extends AdressDetailsState {}

class AdressDetailsError extends AdressDetailsState {}

class AdressDetailsSuccess extends AdressDetailsState {}

class AdressDetailsCubit extends Cubit<AdressDetailsState> {
  AdressDetailsCubit() : super(AdressDetailsInitials());

  Future<void> AdressDetailsService(
      {required String address,
        required String country,
        required String state,
        required String city,
        required String zipCode,
        required BuildContext context}) async {
    emit(AdressDetailsLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "address": address,
      "country": country,
      "state": state,
      "city":city,
      "zipCode": zipCode,

    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.Address, data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "AdressDetails Successfully") {
        print("Response ===> ${response.data}");
        emit(AdressDetailsSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(AdressDetailsError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(AdressDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}