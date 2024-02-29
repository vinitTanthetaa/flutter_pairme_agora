import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class BusinessaddressUpdatesState {}

class BusinessaddressUpdatesInitials extends BusinessaddressUpdatesState {}

class BusinessaddressUpdatesLoading extends BusinessaddressUpdatesState {}

class BusinessaddressUpdatesError extends BusinessaddressUpdatesState {}

class BusinessaddressUpdatesSuccess extends BusinessaddressUpdatesState {}

class BusinessaddressUpdatesCubit extends Cubit<BusinessaddressUpdatesState> {
  BusinessaddressUpdatesCubit() : super(BusinessaddressUpdatesInitials());

  Future<void> BusinessaddressUpdatesService(
      {required String address,
        required String country,
        required String state,
        required String city,
        required String zipCode,
        required String start_date,
        required BuildContext context}) async {
    emit(BusinessaddressUpdatesLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "address": address,
      "country": country,
      "state": state,
      "city": city,
      "zipCode":zipCode,
      "startDate":start_date,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.business_address_update,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "BusinessaddressUpdates Successfully") {
        print("Response ===> ${response.data}");
        emit(BusinessaddressUpdatesSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(BusinessaddressUpdatesError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(BusinessaddressUpdatesError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}