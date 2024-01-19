import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class BusinessprofileupdateState {}

class BusinessprofileupdateInitials extends BusinessprofileupdateState {}

class BusinessprofileupdateLoading extends BusinessprofileupdateState {}

class BusinessprofileupdateError extends BusinessprofileupdateState {}

class BusinessprofileupdateSuccess extends BusinessprofileupdateState {}

class BusinessprofileupdateCubit extends Cubit<BusinessprofileupdateState> {
  BusinessprofileupdateCubit() : super(BusinessprofileupdateInitials());

  Future<void> BusinessprofileupdateService(
      { required File photo_1,
        required File photo_2,
        required File photo_3,
        required File photo_4,
        required File photo_5,
        required File photo_6,
        required PlatformFile file_1,
        required PlatformFile file_2,
        required PlatformFile file_3,
        String? bio,
        required BuildContext context}) async {
    emit(BusinessprofileupdateLoading());
    final dio = Dio();
    FormData formData = FormData();
    formData.fields.add(MapEntry("bio", bio??''));
    if(photo_1.path.isNotEmpty){
      String? fileName = photo_1.path.split('/').last ;
      formData.files.add( MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),);
    }
    if(photo_2.path.isNotEmpty){
      String? fileName = photo_2.path.split('/').last ;
      formData.files.add( MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName)),);
    }
    if(photo_3.path.isNotEmpty){
      String? fileName = photo_3.path.split('/').last ;
      formData.files.add( MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName)),);
    }
    if(photo_4.path.isNotEmpty){
      String? fileName = photo_4.path.split('/').last ;
      formData.files.add( MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName)),);
    }
    if(photo_5.path.isNotEmpty){
      String? fileName = photo_5.path.split('/').last ;
      formData.files.add( MapEntry('photo_5', await MultipartFile.fromFile(photo_5.path, filename: fileName)),);
    }
    if(photo_6.path.isNotEmpty){
      String? fileName = photo_6.path.split('/').last ;
      formData.files.add( MapEntry('photo_6', await MultipartFile.fromFile(photo_6.path, filename: fileName)),);
    }
   if(file_1.name.isNotEmpty){
     formData.files.add( MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),);
   }
   if(file_2.name.isNotEmpty){
     formData.files.add( MapEntry('file_2', await MultipartFile.fromFile(file_2.path!, filename: file_2.name)),);
   }
   if(file_3.name.isNotEmpty){
     formData.files.add( MapEntry('file_3', await MultipartFile.fromFile(file_3.path!, filename: file_3.name)),);
   }

    try {

      Response response = await dio.post(
        apis.profile_update,
        data: formData,
        options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Accept': 'application/json',
              'Authorization': Authtoken,
            }
        ),
      );

      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "data saved successfully") {
        emit(BusinessprofileupdateSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(BusinessprofileupdateError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      emit(BusinessprofileupdateError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}
