import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/notification_modal.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class NotificationState {}

class NotificationInitials extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationError extends NotificationState {}

class NotificationSuccess extends NotificationState {}

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitials());
  final dio = Dio();
  UserNotification userNotification = UserNotification();
  Future<UserNotification?> GetNotification() async {
    emit(NotificationLoading());
    try {
      Response response = await dio.get(apis.notification,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(NotificationSuccess());
        userNotification = UserNotification.fromJson(response.data);
        print("passs");

      }
      return userNotification;
    } on Exception catch (e) {
      emit(NotificationError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return UserNotification();
  }

}
