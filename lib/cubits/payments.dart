import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class PremiumMembershipState {}

class PremiumMembershipInitials extends PremiumMembershipState {}

class PremiumMembershipLoading extends PremiumMembershipState {}

class PremiumMembershipError extends PremiumMembershipState {}

class PremiumMembershipSuccess extends PremiumMembershipState {}

class PremiumMembershipCubit extends Cubit<PremiumMembershipState> {
  PremiumMembershipCubit() : super(PremiumMembershipInitials());

  Future<void> PremiumMembershipService(
      {required String product,
        required BuildContext context}) async {
    emit(PremiumMembershipLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "product": product,
    };
    print("Body is $body");
    try {
      final response = await dio.post(apis.payment,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "PremiumMembership Successfully") {
        print("Response ===> ${response.data}");
        emit(PremiumMembershipSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(PremiumMembershipError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(PremiumMembershipError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}