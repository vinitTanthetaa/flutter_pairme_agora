import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/message_modal.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class MessageState {}

class MessageInitials extends MessageState {}

class MessageLoading extends MessageState {}

class MessageError extends MessageState {}

class MessageSuccess extends MessageState {}

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitials());
  final dio = Dio();
  Future<UserMessage?> GetMessage() async {
    emit(MessageLoading());
    try {
      Response response = await dio.get(apis.message,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(MessageSuccess());
        print("passs");

      }
      return UserMessage.fromJson(response.data);
    } on Exception catch (e) {
      emit(MessageError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }

}
