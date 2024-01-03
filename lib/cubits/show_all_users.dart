import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/city&state.dart';
import 'package:pair_me/Modal/user_profile_modal.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class AllUsersDetailsState {}

class AllUsersDetailsInitials extends AllUsersDetailsState {}

class AllUsersDetailsLoading extends AllUsersDetailsState {}

class AllUsersDetailsError extends AllUsersDetailsState {}

class AllUsersDetailsSuccess extends AllUsersDetailsState {}

class AllUsersDetailsCubit extends Cubit<AllUsersDetailsState> {
  AllUsersDetailsCubit() : super(AllUsersDetailsInitials());
  final dio = Dio();
  Future<UserProfile?> GetAllUsersDetails() async {
    emit(AllUsersDetailsLoading());
    try {
      Response response = await dio.get(apis.showAllProfiles,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }));
      print(response);
      if(response.statusCode == 200 && response.data != null)
      {
        emit(AllUsersDetailsSuccess());
        print("passs");

      }
      return UserProfile.fromJson(response.data);
    } on Exception catch (e) {
      emit(AllUsersDetailsError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }
    return null;
  }

}
