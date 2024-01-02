import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:pair_me/cubits/Buisness_profile.dart';
import 'package:pair_me/cubits/profile_update.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Business_Profile extends StatefulWidget {
  Business_Profile({super.key});

  @override
  State<Business_Profile> createState() => _Business_ProfileState();
}

class _Business_ProfileState extends State<Business_Profile> {
  Uint8List? _highQualityImage;

  // Future<void> compressToHighQuality(File imagefile) async {
  //   print('imsge ==> ' + imagefile.toString());
  //   final File imageFile = imagefile; // Replace with your image file path
  //
  //   // Compressing the image to high quality (quality: 100)
  //   final Uint8List? uint8List = await FlutterImageCompress.compressWithFile(
  //     imageFile.absolute.path,
  //     quality: 100, // Set the desired image quality (0 to 100)
  //   );
  //
  //   setState(() {
  //     _highQualityImage = uint8List;
  //   });
  // }
  BusinessprofileupdateCubit businessprofileupdateCubit = BusinessprofileupdateCubit();
  BusinessProfileCubit businessProfileCubit = BusinessProfileCubit();
  final TextEditingController _bio = TextEditingController();
  SelectedByte? _selectedimag1;
  SelectedByte? _selectedimag2;
  SelectedByte? _selectedimag3;
  SelectedByte? _selectedimag4;
  SelectedByte? _selectedimag5;
  SelectedByte? _selectedimag6;
  PlatformFile? file1;
  PlatformFile? file2;
  PlatformFile? file3;
  bool _hello = false;
  List filelist = [];
  addFolderNameDialog(String delete) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 60),
      backgroundColor: AppColor.white,
      surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Are you sure you want to remove file?',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                fontFamily: 'Roboto'),
          ),
        ),
        const Divider(
          height: 0,
          color: Color(0xffF5F5F5),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.skyBlue, width: 2),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.skyBlue),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  filelist.remove(delete);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal:screenWidth(context,dividedBy: 10),vertical: height),
                  alignment: Alignment.center,
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                        colors: [AppColor.skyBlue, AppColor.whiteskyBlue]),
                  ),
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: AppColor.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                title: custom_header(text: "Profile"),
              ),
              body: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_discription(
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag1?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag1!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                                  picker =
                                                                  ImagePickerPlus(
                                                                      context);
                                                              SelectedImagesDetails?
                                                                  details =
                                                                  await picker
                                                                      .pickBoth(
                                                                source:
                                                                    ImageSource
                                                                        .camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                    true,
                                                                galleryDisplaySettings:
                                                                    GalleryDisplaySettings(
                                                                  appTheme: AppTheme(
                                                                      focusColor:
                                                                          Colors
                                                                              .white,
                                                                      primaryColor:
                                                                          Colors
                                                                              .black),
                                                                  cropImage:
                                                                      true,
                                                                  showImagePreview:
                                                                      true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag1 =
                                                                    details
                                                                        .selectedFiles[0];
                                                                Navigator.pop(
                                                                    context);
                                                                setState(() {});
                                                                print(
                                                                    'selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag1 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag2?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag2!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            // onTap: () async {
                                                            //   // final ImagePicker picker = ImagePicker();
                                                            //   // final image = picker.pickImage(source: ImageSource.gallery);
                                                            //   // print("image ===> $image");
                                                            //   ImagePickerPlus
                                                            //       picker =
                                                            //       ImagePickerPlus(
                                                            //           context);
                                                            //   SelectedImagesDetails?
                                                            //       details =
                                                            //       await picker
                                                            //           .pickBoth(
                                                            //     source:
                                                            //         ImageSource
                                                            //             .camera,
                                                            //
                                                            //     /// On long tap, it will be available.
                                                            //     multiSelection:
                                                            //         true,
                                                            //     galleryDisplaySettings:
                                                            //         GalleryDisplaySettings(
                                                            //       appTheme: AppTheme(
                                                            //           focusColor:
                                                            //               Colors
                                                            //                   .white,
                                                            //           primaryColor:
                                                            //               Colors
                                                            //                   .black),
                                                            //       cropImage:
                                                            //           true,
                                                            //       showImagePreview:
                                                            //           true,
                                                            //     ),
                                                            //   );
                                                            //   print(
                                                            //       'Details ===> ${details}');
                                                            //   if (details !=
                                                            //       null) {
                                                            //     // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                            //     _selectedimag2 =
                                                            //         details
                                                            //             .selectedFiles[0];
                                                            //     Navigator.pop(
                                                            //         context);
                                                            //     setState(() {});
                                                            //     print(
                                                            //         'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                            //   }
                                                            //   // if (details != null) await displayDetails(details);
                                                            // },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag2 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag3?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag3!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            // onTap: () async {
                                                            //   // final ImagePicker picker = ImagePicker();
                                                            //   // final image = picker.pickImage(source: ImageSource.gallery);
                                                            //   // print("image ===> $image");
                                                            //   ImagePickerPlus
                                                            //       picker =
                                                            //       ImagePickerPlus(
                                                            //           context);
                                                            //   SelectedImagesDetails?
                                                            //       details =
                                                            //       await picker
                                                            //           .pickBoth(
                                                            //     source:
                                                            //         ImageSource
                                                            //             .camera,
                                                            //
                                                            //     /// On long tap, it will be available.
                                                            //     multiSelection:
                                                            //         true,
                                                            //     galleryDisplaySettings:
                                                            //         GalleryDisplaySettings(
                                                            //       appTheme: AppTheme(
                                                            //           focusColor:
                                                            //               Colors
                                                            //                   .white,
                                                            //           primaryColor:
                                                            //               Colors
                                                            //                   .black),
                                                            //       cropImage:
                                                            //           true,
                                                            //       showImagePreview:
                                                            //           true,
                                                            //     ),
                                                            //   );
                                                            //   print(
                                                            //       'Details ===> ${details}');
                                                            //   if (details !=
                                                            //       null) {
                                                            //     // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                            //     _selectedimag3 =
                                                            //         details
                                                            //             .selectedFiles[0];
                                                            //     Navigator.pop(
                                                            //         context);
                                                            //     setState(() {});
                                                            //     print(
                                                            //         'selectedByte ==> ${_selectedimag3?.selectedFile}');
                                                            //   }
                                                            //   // if (details != null) await displayDetails(details);
                                                            // },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag3 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag3?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 90),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag4?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag4!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            // onTap: () async {
                                                            //   // final ImagePicker picker = ImagePicker();
                                                            //   // final image = picker.pickImage(source: ImageSource.gallery);
                                                            //   // print("image ===> $image");
                                                            //   ImagePickerPlus
                                                            //       picker =
                                                            //       ImagePickerPlus(
                                                            //           context);
                                                            //   SelectedImagesDetails?
                                                            //       details =
                                                            //       await picker
                                                            //           .pickBoth(
                                                            //     source:
                                                            //         ImageSource
                                                            //             .camera,
                                                            //
                                                            //     /// On long tap, it will be available.
                                                            //     multiSelection:
                                                            //         true,
                                                            //     galleryDisplaySettings:
                                                            //         GalleryDisplaySettings(
                                                            //       appTheme: AppTheme(
                                                            //           focusColor:
                                                            //               Colors
                                                            //                   .white,
                                                            //           primaryColor:
                                                            //               Colors
                                                            //                   .black),
                                                            //       cropImage:
                                                            //           true,
                                                            //       showImagePreview:
                                                            //           true,
                                                            //     ),
                                                            //   );
                                                            //   print(
                                                            //       'Details ===> ${details}');
                                                            //   if (details !=
                                                            //       null) {
                                                            //     // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                            //     _selectedimag4 =
                                                            //         details
                                                            //             .selectedFiles[0];
                                                            //     Navigator.pop(
                                                            //         context);
                                                            //     setState(() {});
                                                            //     print(
                                                            //         'selectedByte ==> ${_selectedimag4?.selectedFile}');
                                                            //   }
                                                            //   // if (details != null) await displayDetails(details);
                                                            // },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag4 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag4?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag5?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag5!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            // onTap: () async {
                                                            //   // final ImagePicker picker = ImagePicker();
                                                            //   // final image = picker.pickImage(source: ImageSource.gallery);
                                                            //   // print("image ===> $image");
                                                            //   ImagePickerPlus
                                                            //       picker =
                                                            //       ImagePickerPlus(
                                                            //           context);
                                                            //   SelectedImagesDetails?
                                                            //       details =
                                                            //       await picker
                                                            //           .pickBoth(
                                                            //     source:
                                                            //         ImageSource
                                                            //             .camera,
                                                            //
                                                            //     /// On long tap, it will be available.
                                                            //     multiSelection:
                                                            //         true,
                                                            //     galleryDisplaySettings:
                                                            //         GalleryDisplaySettings(
                                                            //       appTheme: AppTheme(
                                                            //           focusColor:
                                                            //               Colors
                                                            //                   .white,
                                                            //           primaryColor:
                                                            //               Colors
                                                            //                   .black),
                                                            //       cropImage:
                                                            //           true,
                                                            //       showImagePreview:
                                                            //           true,
                                                            //     ),
                                                            //   );
                                                            //   print(
                                                            //       'Details ===> ${details}');
                                                            //   if (details !=
                                                            //       null) {
                                                            //     // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                            //     _selectedimag5 =
                                                            //         details
                                                            //             .selectedFiles[0];
                                                            //     Navigator.pop(
                                                            //         context);
                                                            //     setState(() {});
                                                            //     print(
                                                            //         'selectedByte ==> ${_selectedimag5?.selectedFile}');
                                                            //   }
                                                            //   // if (details != null) await displayDetails(details);
                                                            // },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag5 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag5?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          Container(
                              height: screenHeight(context, dividedBy: 8),
                              width: screenHeight(context, dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.fontgray,
                                      offset: Offset(
                                        1,
                                        1,
                                      ),
                                      blurRadius: 5,
                                      // spreadRadius: 1.0,
                                    ),
                                  ],
                                  image:
                                  // _selectedimag6?.selectedFile != null
                                  //     ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //         image: FileImage(
                                  //             _selectedimag6!.selectedFile),
                                  //         fit: BoxFit.fill) :
                                  const DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/placeHolderImage.jpg'),
                                          fit: BoxFit.fill)),
                              child: Stack(
                                children: [
                                  // Container(
                                  //   height: screenHeight(context,
                                  //       dividedBy: 8),
                                  //   width: screenHeight(context,
                                  //       dividedBy: 8),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius:
                                  //       BorderRadius.circular(15),
                                  //       boxShadow: const [
                                  //         BoxShadow(
                                  //           color: AppColor.fontgray,
                                  //           offset: Offset(
                                  //             1,
                                  //             1,
                                  //           ),
                                  //           blurRadius: 5,
                                  //           // spreadRadius: 1.0,
                                  //         ),
                                  //       ],
                                  //       image:
                                  //       _selectedimag6
                                  //           ?.selectedFile !=
                                  //           null
                                  //           ? DecorationImage(
                                  //         //  image: AssetImage('assets/Images/vincenzo.png'),
                                  //           image: FileImage(
                                  //               _selectedimag6!
                                  //                   .selectedFile),
                                  //           fit: BoxFit.fill) :
                                  //       const DecorationImage(
                                  //           image: AssetImage(
                                  //               'assets/Images/placeHolderImage.jpg'),
                                  //           fit: BoxFit.fill)
                                  //   ),
                                  // ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topRight:
                                                              Radius.circular(
                                                                  16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        70)),
                                                    child: const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child:
                                                              GestureDetector(
                                                            // onTap: () async {
                                                            //   // final ImagePicker picker = ImagePicker();
                                                            //   // final image = picker.pickImage(source: ImageSource.gallery);
                                                            //   // print("image ===> $image");
                                                            //   ImagePickerPlus
                                                            //       picker =
                                                            //       ImagePickerPlus(
                                                            //           context);
                                                            //   SelectedImagesDetails?
                                                            //       details =
                                                            //       await picker
                                                            //           .pickBoth(
                                                            //     source:
                                                            //         ImageSource
                                                            //             .camera,
                                                            //
                                                            //     /// On long tap, it will be available.
                                                            //     multiSelection:
                                                            //         true,
                                                            //     galleryDisplaySettings:
                                                            //         GalleryDisplaySettings(
                                                            //       appTheme: AppTheme(
                                                            //           focusColor:
                                                            //               Colors
                                                            //                   .white,
                                                            //           primaryColor:
                                                            //               Colors
                                                            //                   .black),
                                                            //       cropImage:
                                                            //           true,
                                                            //       showImagePreview:
                                                            //           true,
                                                            //     ),
                                                            //   );
                                                            //   print(
                                                            //       'Details ===> ${details}');
                                                            //   if (details !=
                                                            //       null) {
                                                            //     // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                            //     _selectedimag6 =
                                                            //         details
                                                            //             .selectedFiles[0];
                                                            //     Navigator.pop(
                                                            //         context);
                                                            //     setState(() {});
                                                            //     print(
                                                            //         'selectedByte ==> ${_selectedimag6?.selectedFile}');
                                                            //   }
                                                            //   // if (details != null) await displayDetails(details);
                                                            // },
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus picker =
                                                            ImagePickerPlus(
                                                                context);
                                                        SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickBoth(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          multiSelection: true,
                                                          galleryDisplaySettings:
                                                              GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                    Colors
                                                                        .white,
                                                                primaryColor:
                                                                    Colors
                                                                        .black),
                                                            cropImage: true,
                                                            showImagePreview:
                                                                true,
                                                          ),
                                                        );
                                                        print(
                                                            'Details ===> ${details}');
                                                        if (details != null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag6 = details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(() {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag6?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy: 2),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              40)),
                                                                  height: screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          40),
                                                                  width: screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          15),
                                                                  decoration: const BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image:
                                                                              AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          17,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColor
                                                                          .dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        15),
                                                            vertical:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                    right: screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            40)),
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            40),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            15),
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/Images/video.png'))),
                                                              ),
                                                              const Text(
                                                                'Videos',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 80),
                      ),
                      const Text(
                        'Pitch Deck',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: AppColor.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 80)),
                        // height: screenHeight(context, dividedBy: 3.5),
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 8,
                              // spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight(context, dividedBy: 50)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DottedBorder(
                                color: AppColor.skyBlue,
                                strokeWidth: 1,
                                child: GestureDetector(
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      // allowMultiple: true,
                                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                                    );

                                    if (filelist.length < 3) {
                                      filelist.add(result!.files.toString());
                                      if (filelist.length == 1) {
                                        file1 = result.files.first;
                                        print("fille1 ======> " +
                                            file1.toString());
                                      } else if (filelist.length == 2) {
                                        file2 = result.files.first;
                                        print("fille2 ======> " +
                                            file2.toString());
                                      } else if (filelist.length == 3) {
                                        file3 = result.files.first;
                                        print("fille3 ======> " +
                                            file3.toString());
                                      }
                                    } else {
                                      flutterToast('Only 3 items Add', false);
                                    }

                                    // if(file1.bytes == null){
                                    //   file1 = ;
                                    //
                                    // } else if(file2.bytes == null){
                                    //   file2 = result!.files.first;
                                    //   print("fille2 ======> " + file2.toString());
                                    // } else {
                                    //   file3 = result!.files.first;
                                    //   print("fille3 ======> " + file3.toString());
                                    // }

                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    height:
                                        screenHeight(context, dividedBy: 13),
                                    width: screenWidth(context, dividedBy: 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: screenHeight(context,
                                              dividedBy: 25),
                                          width: screenWidth(context,
                                              dividedBy: 10),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/upload.png'))),
                                        ),
                                        const Text(
                                          'Browse file to upload',
                                          style: TextStyle(
                                              color: AppColor.skyBlue,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: AppColor.skyBlue,
                                              fontFamily: 'Roboto'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              filelist.length == 1
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: screenHeight(context,
                                              dividedBy: 100)),
                                      height:
                                          screenHeight(context, dividedBy: 15),
                                      width:
                                          screenWidth(context, dividedBy: 1.3),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffEFF4FF),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenWidth(context,
                                                dividedBy: 55)),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: screenWidth(context,
                                                      dividedBy: 90)),
                                              height: screenHeight(context,
                                                  dividedBy: 27),
                                              width: screenWidth(context,
                                                  dividedBy: 15),
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Images/file.png'))),
                                            ),
                                            SizedBox(
                                              height: screenHeight(context,
                                                  dividedBy: 23),
                                              width: screenWidth(context,
                                                  dividedBy: 1.55),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'image_01.jpg',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColor
                                                                .dropdownfont),
                                                      ),
                                                      Text(
                                                        '96.47 KB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 8,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Color(
                                                                0xff838383)),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            addFolderNameDialog(
                                                                filelist[0]),
                                                      );
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      color: AppColor.skyBlue,
                                                      size: 15,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : filelist.length == 2
                                      ? Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight(context,
                                                      dividedBy: 100)),
                                              height: screenHeight(context,
                                                  dividedBy: 15),
                                              width: screenWidth(context,
                                                  dividedBy: 1.3),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffEFF4FF),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: screenWidth(
                                                        context,
                                                        dividedBy: 55)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: screenWidth(
                                                              context,
                                                              dividedBy: 90)),
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 27),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/Images/file.png'))),
                                                    ),
                                                    SizedBox(
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 23),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 1.55),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'image_01.jpg',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                              Text(
                                                                '96.47 KB',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xff838383)),
                                                              ),
                                                            ],
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    addFolderNameDialog(
                                                                        filelist[
                                                                            0]),
                                                              );
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              color: AppColor
                                                                  .skyBlue,
                                                              size: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: screenHeight(context,
                                                      dividedBy: 100)),
                                              height: screenHeight(context,
                                                  dividedBy: 15),
                                              width: screenWidth(context,
                                                  dividedBy: 1.3),
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffEFF4FF),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: screenWidth(
                                                        context,
                                                        dividedBy: 55)),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: screenWidth(
                                                              context,
                                                              dividedBy: 90)),
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 27),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 15),
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/Images/file.png'))),
                                                    ),
                                                    SizedBox(
                                                      height: screenHeight(
                                                          context,
                                                          dividedBy: 23),
                                                      width: screenWidth(
                                                          context,
                                                          dividedBy: 1.55),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          const Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'image_02.jpg',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: AppColor
                                                                        .dropdownfont),
                                                              ),
                                                              Text(
                                                                '96.47 KB',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xff838383)),
                                                              ),
                                                            ],
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder: (context) =>
                                                                    addFolderNameDialog(
                                                                        filelist[
                                                                            1]),
                                                              );
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              color: AppColor
                                                                  .skyBlue,
                                                              size: 15,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : filelist.length == 3
                                          ? Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: screenHeight(context,
                                                          dividedBy: 100)),
                                                  height: screenHeight(context,
                                                      dividedBy: 15),
                                                  width: screenWidth(context,
                                                      dividedBy: 1.3),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffEFF4FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        55)),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              right:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          90)),
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 27),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 15),
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/Images/file.png'))),
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 23),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 1.55),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'image_01.jpg',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: AppColor
                                                                            .dropdownfont),
                                                                  ),
                                                                  Text(
                                                                    '96.47 KB',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Color(
                                                                            0xff838383)),
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (context) =>
                                                                        addFolderNameDialog(
                                                                            filelist[0]),
                                                                  );
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: AppColor
                                                                      .skyBlue,
                                                                  size: 15,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: screenHeight(context,
                                                          dividedBy: 100)),
                                                  height: screenHeight(context,
                                                      dividedBy: 15),
                                                  width: screenWidth(context,
                                                      dividedBy: 1.3),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffEFF4FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        55)),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              right:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          90)),
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 27),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 15),
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/Images/file.png'))),
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 23),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 1.55),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'image_02.jpg',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: AppColor
                                                                            .dropdownfont),
                                                                  ),
                                                                  Text(
                                                                    '96.47 KB',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Color(
                                                                            0xff838383)),
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (context) =>
                                                                        addFolderNameDialog(
                                                                            filelist[1]),
                                                                  );
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: AppColor
                                                                      .skyBlue,
                                                                  size: 15,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: screenHeight(context,
                                                          dividedBy: 100)),
                                                  height: screenHeight(context,
                                                      dividedBy: 15),
                                                  width: screenWidth(context,
                                                      dividedBy: 1.3),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffEFF4FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth(
                                                                    context,
                                                                    dividedBy:
                                                                        55)),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              right:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          90)),
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 27),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 15),
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      'assets/Images/file.png'))),
                                                        ),
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy: 23),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy: 1.55),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'image_03.jpg',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: AppColor
                                                                            .dropdownfont),
                                                                  ),
                                                                  Text(
                                                                    '96.47 KB',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            8,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Color(
                                                                            0xff838383)),
                                                                  ),
                                                                ],
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (context) =>
                                                                        addFolderNameDialog(
                                                                            filelist[2]),
                                                                  );
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  color: AppColor
                                                                      .skyBlue,
                                                                  size: 15,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                      const Text(
                        'Bio',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: AppColor.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight(context, dividedBy: 90)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColor.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                0,
                              ),
                              blurRadius: 8,
                              // spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(context, dividedBy: 25),
                              vertical: screenHeight(context, dividedBy: 150)),
                          child: TextField(
                            maxLength: 250,
                            minLines: 1,
                            maxLines: 7,
                            controller: _bio,
                            cursorColor: AppColor.fontdarkgray,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColor.dropdownfont),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter some words of your Profile',
                                hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15)),
                          ),
                        ),
                      ),
                      Custom_botton(
                        context,
                        text: 'SAVE',
                        onTap: () {
                         // Navigator.pop(context);
                         //  if(_selectedimag1 != null){
                         //    print("hello");
                         //    Navigator.pop(context);
                         //  } else {
                         //    print("try again");
                         //  }
                         //  businessProfileCubit.BusinessProfileService(
                         //      photo_1: _selectedimag1?.selectedFile ?? File(''),
                         //      bio: _bio.text,
                         //      file_2: file2 ?? PlatformFile(name: "", size: 0) ,
                         //      file_3: file3 ?? PlatformFile(name: "", size: 0),
                         //      context: context,
                         //      photo_2: _selectedimag2?.selectedFile ?? File(''),
                         //      photo_3: _selectedimag3?.selectedFile ?? File(''),
                         //      photo_4: _selectedimag4?.selectedFile ?? File(''),
                         //      photo_5: _selectedimag5?.selectedFile ?? File(''),
                         //      photo_6: _selectedimag6?.selectedFile ?? File(''),
                         //      file_1: file1 ?? PlatformFile(name: "", size: 0));
                          businessprofileupdateCubit.BusinessprofileupdateService(photo_1: _selectedimag1?.selectedFile ?? File(''),
                              bio: _bio.text,
                              file_2: file2 ?? PlatformFile(name: "", size: 0) ,
                              file_3: file3 ?? PlatformFile(name: "", size: 0),
                              context: context,
                              photo_2: _selectedimag2?.selectedFile ?? File(''),
                              photo_3: _selectedimag3?.selectedFile ?? File(''),
                              photo_4: _selectedimag4?.selectedFile ?? File(''),
                              photo_5: _selectedimag5?.selectedFile ?? File(''),
                              photo_6: _selectedimag6?.selectedFile ?? File(''),
                              file_1: file1 ?? PlatformFile(name: "", size: 0));
                        },
                        height: screenHeight(context, dividedBy: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
