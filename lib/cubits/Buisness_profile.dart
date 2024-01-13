import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:http_parser/http_parser.dart';


abstract class BusinessProfileState {}

class BusinessProfileInitials extends BusinessProfileState {}

class BusinessProfileLoading extends BusinessProfileState {}

class BusinessProfileError extends BusinessProfileState {}

class BusinessProfileSuccess extends BusinessProfileState {}

class BusinessProfileCubit extends Cubit<BusinessProfileState> {
  BusinessProfileCubit() : super(BusinessProfileInitials());

  Future<void> BusinessProfileService(
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
    emit(BusinessProfileLoading());
    final dio = Dio();
   FormData formData = FormData();
   formData.fields.add(MapEntry("bio", bio??''));
    dio.options.maxRedirects = 200 * 1024 * 1024; // 200 MB
    //  String? fileName = photo_1.path.split('/').last ;
   //  String? fileName1 = photo_2.path.split('/').last;
   //  String? fileName2 = photo_3.path.split('/').last;
   //  String? fileName3 = photo_4.path.split('/').last;
   //  String? fileName4 = photo_5.path.split('/').last;
   //  String? fileName5 = photo_6.path.split('/').last;
   //  FormData formData = FormData.fromMap({
   //    'photo_1': await MultipartFile.fromFile(photo_1.path, filename: fileName),
   //    'photo_2': await MultipartFile.fromFile(photo_2.path, filename: fileName1),
   //    'photo_3': await MultipartFile.fromFile(photo_3.path, filename: fileName2),
   //    'photo_4': await MultipartFile.fromFile(photo_4.path, filename: fileName3),
   //    'photo_5': await MultipartFile.fromFile(photo_5.path, filename: fileName4),
   //    'photo_6': await MultipartFile.fromFile(photo_6.path, filename: fileName5),
   //    // Add more files as needed
   //    'file_1': await MultipartFile.fromFile(file_1.path!),
   //    // 'file_2': await MultipartFile.fromFile(file_2.path!),
   //    // 'file_3': await MultipartFile.fromFile(file_3.path!),
   //    'bio': bio,
   //  });
  //  Adding photo files
    if (photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty && photo_5.path.isNotEmpty && photo_6.path.isNotEmpty)
    {
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      String? fileName4 = photo_5.path.split('/').last;
      String? fileName5 = photo_6.path.split('/').last;
      print("img 6");
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_5', await MultipartFile.fromFile(photo_5.path, filename: fileName4,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_6', await MultipartFile.fromFile(photo_6.path, filename: fileName5,contentType: MediaType("image", "jpeg"))),
      ]);
    } else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty && photo_5.path.isNotEmpty){
      print("img 5");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      String? fileName4 = photo_5.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_5', await MultipartFile.fromFile(photo_5.path, filename: fileName4,contentType: MediaType("image", "jpeg"))),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty && photo_4.path.isNotEmpty ){
      print("img 4");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      String? fileName3 = photo_4.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_4', await MultipartFile.fromFile(photo_4.path, filename: fileName3,contentType: MediaType("image", "jpeg"))),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty && photo_3.path.isNotEmpty){
      print(" img 3");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      String? fileName2 = photo_3.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_3', await MultipartFile.fromFile(photo_3.path, filename: fileName2,contentType: MediaType("image", "jpeg"))),
      ]);
    }else if(photo_1.path.isNotEmpty && photo_2.path.isNotEmpty){
      print("img 2");
      String? fileName = photo_1.path.split('/').last ;
      String? fileName1 = photo_2.path.split('/').last;
      formData.files.addAll([
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path, filename: fileName,contentType: MediaType("image", "jpeg"))),
        MapEntry('photo_2', await MultipartFile.fromFile(photo_2.path, filename: fileName1,contentType: MediaType("image", "jpeg"))),
      ]);
    }else if(photo_1.path.isNotEmpty ){
      print("img 1");
      String? fileName = photo_1.path.split('/').last ;
      formData.files.add(
        MapEntry('photo_1', await MultipartFile.fromFile(photo_1.path ?? "", filename: fileName,contentType: MediaType("image", "jpeg"))),
      );
    }
    // Adding file files
    if(file_1.name.isNotEmpty && file_2.name.isNotEmpty && file_3.name.isNotEmpty ){
      print("file 3");
      formData.files.addAll([
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
        MapEntry('file_2', await MultipartFile.fromFile(file_2.path!, filename: file_2.name)),
        MapEntry('file_3', await MultipartFile.fromFile(file_3.path!, filename: file_3.name)),
      ]);
    } else if(file_1.name.isNotEmpty && file_2.name.isNotEmpty){
      print("file 2");
      formData.files.addAll([
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
        MapEntry('file_2', await MultipartFile.fromFile(file_2.path!, filename: file_2.name)),
      ]);
    }else if(file_1.name.isNotEmpty){
      print("file 1");
      formData.files.add(
        MapEntry('file_1', await MultipartFile.fromFile(file_1.path!, filename: file_1.name)),
      );
    }
    try {
      print("Response ===> ${formData.files}");
      Response response = await dio.post(
        apis.business_profile,
        data: formData,
        options: Options(
           maxRedirects:  200 * 1024 * 1024, // 200 MB
            validateStatus: (status) {
            print("status === > $status");
            return status != null && (status < 500 || status == 413);
          },
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': Authtoken,
          }
        ),
      );

      print("Response ===> ${response.data}");
      final hello = response.data;
      print(hello);
      if (hello['message'] == "data saved successfully") {
        print("Response ===> ${response.data}");
        emit(BusinessProfileSuccess());
      //  print("photo_1 ==> ${photo_1.path}");
        flutterToast(hello['message'], true);
      } else {
        emit(BusinessProfileError());
        flutterToast(hello['message'], false);
      }
    } on Exception catch (e) {
      print("fail ====> " +e.toString());
      emit(BusinessProfileError());
      flutterToast("Something went wrong!", false);
      // TODO
    }
  }
}

// PopupMenuButton(
// offset: Offset(0, 45),
// elevation: 4,
// //color: Colors.green,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// child: Container(
// alignment: Alignment.center,
// height: screenHeight(context,
// dividedBy: 20),
// width: screenWidth(context,dividedBy: 1.5),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(10),
// color: const Color(0xffFFFFFF),
// //color: Colors.green,
// boxShadow: const [
// BoxShadow(
// offset: Offset(0.5, 1.0),
// spreadRadius: 1,
// color: Colors.black12,
// blurRadius: 1),
// ],
// ),
//
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Padding(
// padding: EdgeInsets.only(
// left: screenWidth(context,
// dividedBy: 45),
// ),
// child: Container(
// alignment: Alignment.center,
// width: screenWidth(context,dividedBy: 3.6),
// child: Text(dropDownFolderName,
// maxLines: 1,
// style: const TextStyle(
// overflow: TextOverflow.ellipsis,
// color: Colors.black54,
// fontSize: 14)),
// ),
// ),
// ),
// Padding(
// padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 95)),
// child: customText("OR", ColorCodes.greyText, 10, FontWeight.w100, 'Poppins'),
// ),
// Center(
// child: Padding(
// padding: EdgeInsets.only(
// right: screenWidth(context,
// dividedBy: 45),
// ),
// child: Container(
// alignment: Alignment.center,
// width: screenWidth(context,dividedBy: 3.6),
// child: Text(userNetwork,
// maxLines: 1,
// style: const TextStyle(
// overflow: TextOverflow.ellipsis,
// color: Colors.black54,
// fontSize: 14)),
// ),
// ),
// ),
// ],
// ),
// ),
// itemBuilder: (context) => [
// PopupMenuItem(
// //padding: EdgeInsets.only(top: 10),
// value: 1,
// // row with 2 children
// child: Container(
// // margin: EdgeInsets.only(top: 10),
// height: screenHeight(context,
// dividedBy: 3),
// width: screenWidth(context,dividedBy: 2),
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(10),
// //color: Colors.green,
// color: const Color(0xffFFFFFF),
// //color: Colors.white,
// // boxShadow: const [
// //   BoxShadow(
// //       offset: Offset(0.5, 1.0),
// //       spreadRadius: 1,
// //       color: Colors.black12,
// //       blurRadius: 1),
// // ],
// ),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// height: screenHeight(context, dividedBy: 30),
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.start,
// children: [
// Padding(
// padding:
// const EdgeInsets.only(
// left: 10, right: 7),
// child: GestureDetector(
// onTap: () {
// Navigator.pop(context);
// setState(() {Chang = true;dropDown1 = !dropDown1;});
// showDialog(
// context: context,
// builder: (context) {
// return SimpleDialog(
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius
//     .circular(
// 20)),
// children: [
// Padding(
// padding: const EdgeInsets
//     .symmetric(
// horizontal:
// 20),
// child:
// TextField(
// textInputAction:
// TextInputAction
//     .done,
// onSubmitted:
// (value) {
// if (folderNameC
//     .text
//     .isNotEmpty &&
// folderNameC.text != null) {
// getGiftedCubit
//     .getAddFolder(context,
// folderName: folderNameC.text,
// isPublic: isPublic)
//     .then((value) {
// Navigator.pop(
// context);
// getGiftedViewCubit
//     .getViewGift();
// folderNameC
//     .clear();
// });
// } else {
// flutterToast(
// 'Enter Folder Name',
// false);
// }
// },
// cursorColor:
// Colors
//     .black45,
// controller:
// folderNameC,
// decoration: InputDecoration(
// border: InputBorder
//     .none,
// hintText:
// 'Folder name',
// hintStyle:
// TextStyle(fontFamily: poppins)),
// ),
// ),
// Container(
// width: 200,
// height: 1,
// decoration: const BoxDecoration(
// color: Colors
//     .black12,
// boxShadow: [
// BoxShadow(
// color:
// Colors.black38,
// blurRadius: 5)
// ]),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceEvenly,
// children: [
// InkWell(
// onTap:
// () {
// setState(
// () {
// Chang =
// false;
// });
// Navigator.pop(
// context);
// },
// child:
// Container(
// margin: const EdgeInsets.only(
// top:
// 5),
// height:
// 20,
// width:
// 100,
// alignment:
// Alignment.center,
// child: Padding(
// padding:
// const EdgeInsets.only(left: 8.0),
// child: customText("Cancel", ColorCodes.greyText, 14, FontWeight.w400, poppins)),
// ),
// ),
// Container(
// width: 1,
// height:
// 30,
// decoration: const BoxDecoration(
// color:
// Colors.black12,
// // boxShadow: [
// //   BoxShadow(
// //       color: Colors.black38,
// //       blurRadius: 5)
// // ]
// ),
// ),
// InkWell(
// onTap:
// () {
// if (folderNameC.text.isNotEmpty &&
// folderNameC.text != null) {
// getGiftedCubit
//     .getAddFolder(context, folderName: folderNameC.text, isPublic: isPublic)
//     .then((value) {
// setState(() {
// getGiftedViewCubit.getViewGift();
// });
// Navigator.pop(context);
// folderNameC.clear();
// });
// } else {
// flutterToast(
// 'Enter Folder Name',
// false);
// }
// Timer(
// Duration(milliseconds: 900),
// () {
// setState(
// () {
// getGiftedViewCubit.getViewGift();
// Chang =
// false;
// dropDown1 =
// !dropDown1;
// });
// });
// // Chang = false;
// setState(
// () {});
// },
// child:
// Container(
// margin: const EdgeInsets.only(
// top:
// 5),
// height:
// 20,
// width:
// 100,
// alignment:
// Alignment.center,
// child: BlocBuilder<
// GetGiftedViewCubit,
// GetGiftedViewState>(builder: (context, state) {
// if (state
// is GetGiftedViewLoading) {
// return spinkitLoader(context,
// ColorCodes.greyButton);
// }
// return Padding(
// padding: const EdgeInsets.only(left: 8.0),
// child: customText("Save", ColorCodes.greyText, 14, FontWeight.w400, poppins));
// }),
// ),
// )
// ],
// )
// ],
// );
// },
// );
// },
// child: Image.asset(
// ImageConstants
//     .addDate,
// height: screenHeight(
// context,
// dividedBy: 25),
// width: screenWidth(
// context,
// dividedBy: 25),
// fit: BoxFit.contain),
// ),
// ),
// customText(
// "Add Folder",
// ColorCodes.greyText,
// 15,
// FontWeight.w100,
// "Poppins"),
// ],
// ),
// ),
// Divider(
// color: ColorCodes.greyDetailBox,
// thickness: 1,
// height: 0,
// ),
// Padding(
// padding: const EdgeInsets.only(
// left: 8.0,top: 5),
// child: customText(
// "Wishlists",
// ColorCodes.greyText,
// 15,
// FontWeight.w100,
// "Poppins"),
// ),
// Container(
// height: screenHeight(context, dividedBy: 10),
// width: screenWidth(context),
// child: Chang == false
// ? Scrollbar(
// thickness: 8,
// radius:
// Radius.circular(16),
// thumbVisibility: true,
// controller:
// _secondController,
// child: ListView.builder(
// controller:
// _secondController,
//
// padding:
// EdgeInsets.only(
// bottom: 30,
// left: 10),
// itemCount:
// getGiftedViewCubit
//     .viewGift
//     ?.allData
//     ?.length,
//
// itemBuilder:
// (context, index) {
// return
// GestureDetector(
// onTap: () {
// dropDownFolderId =
// getGiftedViewCubit
//     .viewGift
//     ?.allData?[index].id ?? '';
//
// dropDownFolderName = getGiftedViewCubit
//     .viewGift
//     ?.allData?[
// index]
//     .folderName ??
// '';
// userId = null;
// userNetwork = 'Choose a Gftr';
// Navigator.pop(context);
// setState(() {});
// },
// child: Container(
// margin: EdgeInsets.only(bottom: 8),
// child: customText(
// getGiftedViewCubit
//     .viewGift
//     ?.allData?[
// index]
//     .folderName ??
// '',
// Colors.black,
// 15,
// FontWeight.w100,
// poppins),
// ),
// );
// },
// ),
// )
//     : customLoader(context),
// ),
// Divider(
// color: ColorCodes.greyDetailBox,
// thickness: 1,
// height: 0,
// ),
// Padding(
// padding: const EdgeInsets.only(
// left: 8.0,top: 5),
// child: customText(
// "Gftr Group",
// ColorCodes.greyText,
// 15,
// FontWeight.w100,
// "Poppins"),
// ),
// SizedBox(
// height: screenHeight(context,
// dividedBy: 10),
// width: screenWidth(context),
// child: Scrollbar(
// thickness: 8,
// radius: Radius.circular(16),
// thumbVisibility: true,
// controller: _firstController,
// child: ListView.builder(
// controller: _firstController,
// padding:
// EdgeInsets.only(left: 10,bottom: 20),
// itemCount: getGiftedViewCubit
//     .viewGift
//     ?.groupsData
//     ?.length,
// itemBuilder:
// (context, index) =>
// GestureDetector(
// onTap: () {
// userId =
// getGiftedViewCubit
//     .viewGift
//     ?.groupsData?[
// index]
//     .id;
//
// userNetwork =
// getGiftedViewCubit
//     .viewGift
//     ?.groupsData?[
// index]
//     .name ??
// '';
// dropDownFolderName = 'Select Folder';
// dropDownFolderId = null;
// Navigator.pop(context);
// setState(() {});
// },
// child: Container(
// margin: EdgeInsets.only(bottom: 10),
// child: Text(
// getGiftedViewCubit
//     .viewGift
//     ?.groupsData?[index]
//     .name ??
// '',
// style: TextStyle(
// overflow:
// TextOverflow
//     .ellipsis,
// color: Colors.black,
// fontFamily: poppins,
// fontSize: 14,
// fontWeight:
// FontWeight
//     .w100),
// ),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// )
// ],),