import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class DescribeYourSelfState {}

class DescribeYourSelfInitials extends DescribeYourSelfState {}

class DescribeYourSelfLoading extends DescribeYourSelfState {}

class DescribeYourSelfError extends DescribeYourSelfState {}

class DescribeYourSelfSuccess extends DescribeYourSelfState {}

class DescribeYourSelfCubit extends Cubit<DescribeYourSelfState> {
  DescribeYourSelfCubit() : super(DescribeYourSelfInitials());

  Future<void> DescribeYourSelfService(
      {required List array,
        required BuildContext context}) async {
    emit(DescribeYourSelfLoading());
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
        emit(DescribeYourSelfSuccess());
       // flutterToast(hello['message'], true);
      } else {
        emit(DescribeYourSelfError());
        //flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(DescribeYourSelfError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}