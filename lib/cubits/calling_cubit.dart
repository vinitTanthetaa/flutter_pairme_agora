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
        required String msg,
         String? rtc,
        required BuildContext context}) async {
    emit(CallingDetailsLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "from": from,
      "to": to,
      "type": type,
      "rtc": rtc ?? '',
      "msg":msg
    };
     print("Body is $body");
    try {
      final response = await dio.post(apis.calling,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      final hello = response.data;
      if (hello['message'] == "CallingDetails Successfully") {
        emit(CallingDetailsSuccess());
      } else {
        emit(CallingDetailsError());
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(CallingDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}