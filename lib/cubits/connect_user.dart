import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ConnectUserState {}

class ConnectUserInitials extends ConnectUserState {}

class ConnectUserLoading extends ConnectUserState {}

class ConnectUserError extends ConnectUserState {}

class ConnectUserSuccess extends ConnectUserState {}

class ConnectUserCubit extends Cubit<ConnectUserState> {
  ConnectUserCubit() : super(ConnectUserInitials());
  final dio = Dio();
  Future<void> GetConnectUser({required String id}) async {
    print("id ==> $id");
    emit(ConnectUserLoading());
    try {
      Response response = await dio.get('${apis.connectUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(ConnectUserSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(ConnectUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}