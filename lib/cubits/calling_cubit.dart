import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class CallingDetailsState {}

class CallingDetailsInitials extends CallingDetailsState {}

class CallingDetailsLoading extends CallingDetailsState {}

class CallingDetailsError extends CallingDetailsState {}

class CallingDetailsSuccess extends CallingDetailsState {}

class CallingDetailsCubit extends Cubit<CallingDetailsState> {
  CallingDetailsCubit() : super(CallingDetailsInitials());

  Future<void> CallingDetailsService(
      {required String from,
        required String to,
        required String type,
        required BuildContext context}) async {
    emit(CallingDetailsLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
      "type": type,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.calling,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "CallingDetails Successfully") {
        print("Response ===> ${response.data}");
        emit(CallingDetailsSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(CallingDetailsError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(CallingDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}