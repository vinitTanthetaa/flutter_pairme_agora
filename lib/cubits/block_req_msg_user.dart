import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class BlockUserState {}

class BlockUserInitials extends BlockUserState {}

class BlockUserLoading extends BlockUserState {}

class BlockUserError extends BlockUserState {}

class BlockUserSuccess extends BlockUserState {}

class BlockUserCubit extends Cubit<BlockUserState> {
  BlockUserCubit() : super(BlockUserInitials());
  final dio = Dio();
  Future<void> AcceptNotification({required String id}) async {
    print("id ==> $id");
    emit(BlockUserLoading());
    try {
      Response response = await dio.get('${apis.blockreqUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(BlockUserSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(BlockUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}