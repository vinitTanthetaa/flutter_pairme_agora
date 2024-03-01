import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class OnlineOfflinestatusState {}

class OnlineOfflinestatusInitials extends OnlineOfflinestatusState {}

class OnlineOfflinestatusLoading extends OnlineOfflinestatusState {}

class OnlineOfflinestatusError extends OnlineOfflinestatusState {}

class OnlineOfflinestatusSuccess extends OnlineOfflinestatusState {}

class OnlineOfflinestatusCubit extends Cubit<OnlineOfflinestatusState> {
  OnlineOfflinestatusCubit() : super(OnlineOfflinestatusInitials());
  final dio = Dio();
  Future<void> OnlineStatus(BuildContext context,{required String id}) async {
    print("id ==> $id");
    emit(OnlineOfflinestatusLoading());
    try {
      Response response = await dio.get('${apis.onlineStatus}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(OnlineOfflinestatusSuccess());
        // Navigator.pop(context, "refresh");
        print("passs");
      }
    } on Exception catch (e) {
      emit(OnlineOfflinestatusError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
  Future<void> OfflineStatus(BuildContext context,{required String id}) async {
    print("id ==> $id");
    emit(OnlineOfflinestatusLoading());
    try {
      Response response = await dio.get('${apis.offlineStatus}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(OnlineOfflinestatusSuccess());
        // Navigator.pop(context, "refresh");
        print("passs");
      }
    } on Exception catch (e) {
      emit(OnlineOfflinestatusError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}