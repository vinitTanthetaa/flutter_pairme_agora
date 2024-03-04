import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';

import '../Modal/find_user_status_modal.dart';


abstract class FindStatusState {}

class FindStatusInitials extends FindStatusState {}

class FindStatusLoading extends FindStatusState {}

class FindStatusError extends FindStatusState {}

class FindStatusSuccess extends FindStatusState {}

class FindStatusCubit extends Cubit<FindStatusState> {
  FindStatusCubit() : super(FindStatusInitials());
  final dio = Dio();
  FindUserStatus findUserStatus = FindUserStatus();
  Future<FindUserStatus?> FindStatus(BuildContext context,{required String id}) async {
    print("id ==> $id");
    emit(FindStatusLoading());
    try {
      Response response = await dio.get('${apis.findStatus}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        findUserStatus = FindUserStatus.fromJson(response.data);
        emit(FindStatusSuccess());
        print("passs");
        return findUserStatus;
      }
      return findUserStatus;
    } on Exception catch (e) {
      emit(FindStatusError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}