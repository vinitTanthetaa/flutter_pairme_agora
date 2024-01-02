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
    // Adding photo files
    if (photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty && photo_5.path.isNotEmpty && photo_6.path.isNotEmpty)
    {
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      String? fileName4 = photo_5.path.split('/').last;
      String? fileName5 = photo_6.path.split('/').last;
      print("6");
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1)),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2)),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3)),
        MapEntry('photo_5', await MultipartFile.fromFile(photo_5.path, filename: fileName4)),
        MapEntry('photo_6', await MultipartFile.fromFile(photo_6.path, filename: fileName5)),
      ]);
    } else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty && photo_5.path.isNotEmpty){
      print("5");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      String? fileName4 = photo_5.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1)),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2)),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3)),
        MapEntry('photo_5', await MultipartFile.fromFile(photo_5.path, filename: fileName4)),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty ){
      print("4");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1)),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2)),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3)),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty){
      print("3");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1)),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2)),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty){
      print("2");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName)),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1)),
      ]);
    }else if(photo_1.path.isNotEmpty ){
      print("1");
      String? fileName = photo_1.path.split('/').last ;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path ?? "", filename: fileName)),
      ]);
    }
    // Adding file files
    if(file_1.name.isNotEmpty && file_2.name.isNotEmpty && file_3.name.isNotEmpty ){
      formData.files.addAll([
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
        MapEntry('file_2', await MultipartFile.fromFile(file_2.path!, filename: file_2.name)),
        MapEntry('file_3', await MultipartFile.fromFile(file_3.path!, filename: file_3.name)),
      ]);
    } else if(file_1.name.isNotEmpty && file_2.name.isNotEmpty){
      formData.files.addAll([
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
        MapEntry('file_2', await MultipartFile.fromFile(file_2.path!, filename: file_2.name)),
      ]);
    }else if(file_1.name.isNotEmpty){
      formData.files.addAll([
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
      ]);
    }
    try {
      print("frodata ==> ${formData.fields}");
      print("frodata ==> ${formData.files}");
      print("bio ==> $bio");
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
        print("Response ===> ${response.data}");
        emit(BusinessprofileupdateSuccess());
        //  print("photo_1 ==> ${photo_1.path}");
        flutterToast(hello['message'], true);
      } else {
        emit(BusinessprofileupdateError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(BusinessprofileupdateError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}
