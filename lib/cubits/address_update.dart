import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class AddressDetailsState {}

class AddressDetailsInitials extends AddressDetailsState {}

class AddressDetailsLoading extends AddressDetailsState {}

class AddressDetailsError extends AddressDetailsState {}

class AddressDetailsSuccess extends AddressDetailsState {}

class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  AddressDetailsCubit() : super(AddressDetailsInitials());

  Future<void> AddressDetailsService(
      {required String address,
        required String country,
        required String state,
        required String city,
        required String zipCode,
        required BuildContext context}) async {
    emit(AddressDetailsLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "address": address,
      "country": country,
      "state": state,
      "city": city,
      "zipCode":zipCode,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.address_update,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "AddressDetails Successfully") {
        print("Response ===> ${response.data}");
        emit(AddressDetailsSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(AddressDetailsError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(AddressDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}