import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class RejectUserState {}

class RejectUserInitials extends RejectUserState {}

class RejectUserLoading extends RejectUserState {}

class RejectUserError extends RejectUserState {}

class RejectUserSuccess extends RejectUserState {}

class RejectUserCubit extends Cubit<RejectUserState> {
  RejectUserCubit() : super(RejectUserInitials());
  final dio = Dio();
  Future<void> GetRejectUser({required String id}) async {
    print("id ==> $id");
    emit(RejectUserLoading());
    try {
      Response response = await dio.get('${apis.rejectedUser}$id',options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(RejectUserSuccess());
        print("passs");

      }
    } on Exception catch (e) {
      emit(RejectUserError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
  }
}