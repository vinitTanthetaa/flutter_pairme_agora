import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class GenerateTokenState {}

class GenerateTokenInitials extends GenerateTokenState {}

class GenerateTokenLoading extends GenerateTokenState {}

class GenerateTokenError extends GenerateTokenState {}

class GenerateTokenSuccess extends GenerateTokenState {}

class GenerateTokenCubit extends Cubit<GenerateTokenState> {
  GenerateTokenCubit() : super(GenerateTokenInitials());

  Future<void> GenerateTokenService(
      {required String product,
        required BuildContext context}) async {
    emit(GenerateTokenLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "channel": product,
    };
    print("Body is $body");
    try {
      final response = await dio.post('http://192.168.29.113:3000/rtc',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("response ====> $response");
     Rtctoken = response.data['rtcToken'];
     print("token ====> $Rtctoken");
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(GenerateTokenError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}