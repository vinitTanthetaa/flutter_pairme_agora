import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/city&state.dart';
import 'package:pair_me/helper/Apis.dart';


abstract class CityStateState {}

class CityStateInitials extends CityStateState {}

class CityStateLoading extends CityStateState {}

class CityStateError extends CityStateState {}

class CityStateSuccess extends CityStateState {}

class CityStateCubit extends Cubit<CityStateState> {
  CityStateCubit() : super(CityStateInitials());
  final dio = Dio();
  Future<CityandState?> getcalendarEvents({required String country}) async {
    emit(CityStateLoading());
    try {
      Response response = await dio.get('${apis.city}/$country');
      print(response);
      if(response.statusCode == 200 && response.data != null)
        {
          emit(CityStateSuccess());
          print("passs");

        }
      return CityandState.fromJson(response.data);
    } on Exception catch (e) {
      emit(CityStateError());
      print("you are fully fail my friend" + e.toString());
      // TODO
    }

  }

}
