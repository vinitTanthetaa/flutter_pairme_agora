import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class AcceptorRejectState {}

class AcceptorRejectInitials extends AcceptorRejectState {}

class AcceptorRejectLoading extends AcceptorRejectState {}

class AcceptorRejectError extends AcceptorRejectState {}

class AcceptorRejectSuccess extends AcceptorRejectState {}

class AcceptorRejectCubit extends Cubit<AcceptorRejectState> {
  AcceptorRejectCubit() : super(AcceptorRejectInitials());
  final dio = Dio();
  Future<void> AcceptNotification({required String id}) async {
    print("id ==> $id");
    emit(AcceptorRejectLoading());
    try {
      Response response = await dio.get('${apis.acceptNotification}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(AcceptorRejectSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(AcceptorRejectError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
  Future<void> RejectNotification({required String id}) async {
    print("id ==> $id");
    emit(AcceptorRejectLoading());
    try {
      Response response = await dio.get('${apis.rejectNotification}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(AcceptorRejectSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(AcceptorRejectError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}