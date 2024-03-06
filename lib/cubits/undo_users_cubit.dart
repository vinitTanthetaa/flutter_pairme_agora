import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class UndoUsersState {}

class UndoUsersInitials extends UndoUsersState {}

class UndoUsersLoading extends UndoUsersState {}

class UndoUsersError extends UndoUsersState {}

class UndoUsersSuccess extends UndoUsersState {}

class UndoUsersCubit extends Cubit<UndoUsersState> {
  UndoUsersCubit() : super(UndoUsersInitials());
  final dio = Dio();
  Future<void> GetUndoUsers({required String id,required String key}) async {
    Map<String, dynamic> body = {
      "key": key,
    };
    emit(UndoUsersLoading());
    try {
      Response response = await dio.post('${apis.undousers}$id',data: jsonEncode(body),options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(UndoUsersSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(UndoUsersError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}