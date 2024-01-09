import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ClearAllNotificationState {}

class ClearAllNotificationInitials extends ClearAllNotificationState {}

class ClearAllNotificationLoading extends ClearAllNotificationState {}

class ClearAllNotificationError extends ClearAllNotificationState {}

class ClearAllNotificationSuccess extends ClearAllNotificationState {}

class ClearAllNotificationCubit extends Cubit<ClearAllNotificationState> {
  ClearAllNotificationCubit() : super(ClearAllNotificationInitials());
  final dio = Dio();
  Future<void> GetClearAllNotification() async {
    emit(ClearAllNotificationLoading());
    try {
      Response response = await dio.get(apis.clearAll,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(ClearAllNotificationSuccess());
        print("passs");

      }
      return response.data;
    } on Exception catch (e) {
      emit(ClearAllNotificationError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }

}
