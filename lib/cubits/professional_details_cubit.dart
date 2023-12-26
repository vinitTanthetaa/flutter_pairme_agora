import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';


abstract class ProfessionalDetailsState {}

class ProfessionalDetailsInitials extends ProfessionalDetailsState {}

class ProfessionalDetailsLoading extends ProfessionalDetailsState {}

class ProfessionalDetailsError extends ProfessionalDetailsState {}

class ProfessionalDetailsSuccess extends ProfessionalDetailsState {}

class ProfessionalDetailsCubit extends Cubit<ProfessionalDetailsState> {
  ProfessionalDetailsCubit() : super(ProfessionalDetailsInitials());

  Future<void> ProfessionalDetailsService(
      {required String company_name,
        required String add_role,
        required String company_domain,
        required String email,
        required String category,
        required String business_experience,
        required String skills,
        required String education,
        required String university,
        required BuildContext context}) async {
    emit(ProfessionalDetailsLoading());
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
    try {
      final response = await dio.post(apis.professional_details,options:  Options(headers: {
        'Content-Type': 'application/json',
        'Authorization': Authtoken,
      }) ,data: jsonEncode(body));
      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "ProfessionalDetails Successfully") {
        print("Response ===> ${response.data}");
        emit(ProfessionalDetailsSuccess());
        flutterToast(hello['message'], true);
      } else {
        emit(ProfessionalDetailsError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(ProfessionalDetailsError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}