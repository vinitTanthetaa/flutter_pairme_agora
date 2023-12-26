import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class BusinessDetailsState {}

class BusinessDetailsInitials extends BusinessDetailsState {}

class BusinessDetailsLoading extends BusinessDetailsState {}

class BusinessDetailsError extends BusinessDetailsState {}

class BusinessDetailsSuccess extends BusinessDetailsState {}

class BusinessDetailsCubit extends Cubit<BusinessDetailsState> {
  BusinessDetailsCubit() : super(BusinessDetailsInitials());

  Future<void> BusinessDetailsService(
      {required String address,
        required String country,
        required String state,
        required String city,
        required String zipCode,
        required String startDate,
        required BuildContext context}) async {
    emit(BusinessDetailsLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "address": address,
      "country": country,
      "state": state,
      "city":city,
      "zipCode": zipCode,
      "startDate": startDate,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.business_address,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "BusinessDetails Successfully") {
        print("Response ===> ${response.data}");
        emit(BusinessDetailsSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(BusinessDetailsError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(BusinessDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}