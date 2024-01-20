import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/message_request_id.dart';
import 'package:pair_me/Modal/message_user_infornation.dart';
import 'package:pair_me/Screen_Pages/bottom_bar/message_bottom_page.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class RemoveMsgUserState {}

class RemoveMsgUserInitials extends RemoveMsgUserState {}

class RemoveMsgUserLoading extends RemoveMsgUserState {}

class RemoveMsgUserError extends RemoveMsgUserState {}

class RemoveMsgUserSuccess extends RemoveMsgUserState {}

class RemoveMsgUserCubit extends Cubit<RemoveMsgUserState> {
  RemoveMsgUserCubit() : super(RemoveMsgUserInitials());
  final dio = Dio();
  Future DeleteUser(BuildContext context,{required String id}) async {
    print("id ==> $id");
    emit(RemoveMsgUserLoading());
    try {
      Response response = await dio.get('${apis.deletemsgUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      final hello = response.data;
      print("hello ==> $hello");
      if(response.statusCode == 200 && response.data != null)
      {
        emit(RemoveMsgUserSuccess());

      }
      return response.data;
    } on Exception catch (e) {
      emit(RemoveMsgUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }
  Future DeleteReqUser(BuildContext context,{required String id}) async {
    print("id ==> $id");
    emit(RemoveMsgUserLoading());
    try {
      Response response = await dio.get('${apis.deletereqmsgUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      final hello = response.data;
      print("hello ==> $hello");
      if(response.statusCode == 200 && response.data != null)
      {
        emit(RemoveMsgUserSuccess());

      }
      return response.data;
    } on Exception catch (e) {
      emit(RemoveMsgUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }
  Future DeleteAllReqUser(BuildContext context) async {
    emit(RemoveMsgUserLoading());
    try {
      Response response = await dio.get(apis.deleteAllreqmsgUser,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      final hello = response.data;
      print("hello ==> $hello");
      if(response.statusCode == 200 && response.data != null)
      {
        emit(RemoveMsgUserSuccess());

      }
      return response.data;
    } on Exception catch (e) {
      emit(RemoveMsgUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }
}