import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ProfessionalDetailsUpdateState {}

class ProfessionalDetailsUpdateInitials extends ProfessionalDetailsUpdateState {}

class ProfessionalDetailsUpdateLoading extends ProfessionalDetailsUpdateState {}

class ProfessionalDetailsUpdateError extends ProfessionalDetailsUpdateState {}

class ProfessionalDetailsUpdateSuccess extends ProfessionalDetailsUpdateState {}

class ProfessionalDetailsUpdateCubit extends Cubit<ProfessionalDetailsUpdateState> {
  ProfessionalDetailsUpdateCubit() : super(ProfessionalDetailsUpdateInitials());

  Future<void> ProfessionalDetailsUpdateService(
      {
      required String company_name,
        required String add_role,
        required String company_domain,
        required String email,
        required String category,
        required String business_experience,
        required String skills,
        required String education,
        required String university,
        required BuildContext context}) async {
    emit(ProfessionalDetailsUpdateLoading());
    final dio = Dio();
    Map<String, dynamic> body = {
      "company_name": company_name,
      "add_role": add_role,
      "company_domain": company_domain,
      "email":email,
      "category": category,
      "business_experience": business_experience,
      "skills": skills,
      "education": education,
      "university": university,

    };
    print("Body is $body");
    emit(ProfessionalDetailsUpdateLoading());
    try {
      final response = await dio.post(apis.professional_details_update,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "ProfessionalDetailsUpdate Successfully") {
        print("Response ===> ${response.data}");
        emit(ProfessionalDetailsUpdateSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(ProfessionalDetailsUpdateError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ProfessionalDetailsUpdateError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}