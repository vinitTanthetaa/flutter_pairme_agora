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


abstract class MsgReqbyIDState {}

class MsgReqbyIDInitials extends MsgReqbyIDState {}

class MsgReqbyIDLoading extends MsgReqbyIDState {}

class MsgReqbyIDError extends MsgReqbyIDState {}

class MsgReqbyIDSuccess extends MsgReqbyIDState {}

class MsgReqbyIDCubit extends Cubit<MsgReqbyIDState> {
  MsgReqbyIDCubit() : super(MsgReqbyIDInitials());
  UserMsgReq userMsgReq = UserMsgReq();
  final dio = Dio();
  Future AcceptNotification(BuildContext context,{required String id,required String name,required String image}) async {
    print("id ==> $id");
    emit(MsgReqbyIDLoading());
    try {
      Response response = await dio.get('${apis.messageReqUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      final hello = response.data;
      print("hello ==> $hello");
      if(response.statusCode == 200 && response.data != null)
      {
        emit(MsgReqbyIDSuccess());
        if(hello['msg'] == "This User Already In messagePage"){
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return Chatting_Page(
              name: 'chatting',
              Username:  name,
              image: image,
            );
          },));
        }else{
          userMsgReq = UserMsgReq.fromJson(response.data);
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return Chatting_Page(
              name: 'chatting',
              Username:  userMsgReq.data?.withoutConnect?[0].userName ?? '',
              image: userMsgReq.data?.withoutConnect?[0].userImage ?? '',
            );
          },));
        }
      }
      return response.data;
    } on Exception catch (e) {
      emit(MsgReqbyIDError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }
}