import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ConnectwithState {}

class ConnectwithInitials extends ConnectwithState {}

class ConnectwithLoading extends ConnectwithState {}

class ConnectwithError extends ConnectwithState {}

class ConnectwithSuccess extends ConnectwithState {}

class ConnectwithCubit extends Cubit<ConnectwithState> {
  ConnectwithCubit() : super(ConnectwithInitials());

  Future<void> ConnectwithService(
      {required List array,
        required BuildContext context}) async {
    emit(ConnectwithLoading());
    final dio = Dio();
    final body = {
      "array": array,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.describe_yourself,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['code'] == 200) {
        print("Response ===> ${response.data}");
        emit(ConnectwithSuccess());
        // flutterToast(hello['message'], true);
      } else {
        emit(ConnectwithError());
        //flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ConnectwithError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}