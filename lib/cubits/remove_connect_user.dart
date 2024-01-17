import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class RemoveUserState {}

class RemoveUserInitials extends RemoveUserState {}

class RemoveUserLoading extends RemoveUserState {}

class RemoveUserError extends RemoveUserState {}

class RemoveUserSuccess extends RemoveUserState {}

class RemoveUserCubit extends Cubit<RemoveUserState> {
  RemoveUserCubit() : super(RemoveUserInitials());
  final dio = Dio();
  Future<void> AcceptNotification({required String id}) async {
    print("id ==> $id");
    emit(RemoveUserLoading());
    try {
      Response response = await dio.get('${apis.disconnectUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(RemoveUserSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(RemoveUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}