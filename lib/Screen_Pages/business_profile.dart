import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_plus/image_picker_plus.dart';
import 'package:pair_me/Screen_Pages/Step_Screens.dart';
import 'package:pair_me/Screen_Pages/view_pdf.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/flutter_toast.dart';
import 'package:path/path.dart' as path;
import 'package:pair_me/cubits/Buisness_profile.dart';
import 'package:pair_me/cubits/profile_update.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:video_player/video_player.dart';

class Business_Profile extends StatefulWidget {
  String image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      file4,
      file5,
      file6,
      bio;
  Business_Profile(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4,
      required this.image5,
      required this.image6,
      required this.file4,
      required this.file5,
      required this.file6,
      required this.bio});

  @override
  State<Business_Profile> createState() => _Business_ProfileState();
}

class _Business_ProfileState extends State<Business_Profile> {
  BusinessprofileupdateCubit businessprofileupdateCubit = BusinessprofileupdateCubit();
  BusinessProfileCubit businessProfileCubit = BusinessProfileCubit();
  final TextEditingController _bio = TextEditingController();
  String fileName1 = '';
  String fileName2 = '';
  String fileName3 = '';
  SelectedByte? _selectedimag1;
  SelectedByte? _selectedimag2;
  SelectedByte? _selectedimag3;
  SelectedByte? _selectedimag4;
  SelectedByte? _selectedimag5;
  SelectedByte? _selectedimag6;
  bool _files1 = false;
  bool _files2 = false;
  bool _files3 = false;
  PlatformFile? file1;
  PlatformFile? file2;
  PlatformFile? file3;
  getpath(var filePath){
    String fileName = path.basename(filePath);

    // Splitting the name using '-' as a separator
    List<String> nameParts = fileName.split('-');

    // Assuming the desired part is always at index 1
    return nameParts.length > 1 ? nameParts[1] : fileName;
  }
  getdata() {
    _bio.text = widget.bio;
    if(widget.file4.isNotEmpty){
      fileName1 = getpath(widget.file4);
    }
    if(widget.file5.isNotEmpty){
      fileName2 = getpath(widget.file5);
    }
    if(widget.file5.isNotEmpty){
      fileName3 = getpath(widget.file5);
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    businessprofileupdateCubit = BlocProvider.of<BusinessprofileupdateCubit>(context);
    getdata();
  }

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
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_discription(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor."),
                      SizedBox(
                        height: screenHeight(context, dividedBy: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _selectedimag1?.selectedFile != null
                              ? Container(
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
                                    ),
                                  child: Stack(
                                    children: [
                                      _selectedimag1!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag1!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag1!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    setState(
                                                                        () {});
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

                                                              /// On long tap, it will be available.
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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
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
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            17),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

                                                              /// On long tap, it will be available.
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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
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
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    screenHeight(
                                                                        context,
                                                                        dividedBy:
                                                                            17),
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                      ),
                                    ],
                                  ))
                              : Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
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
                              ),
                              child: Stack(
                                children: [
                                  widget.image1.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image1}',) : CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image1}',    errorWidget: (context, url, error) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                      ),
                                    );
                                  },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag1 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag1 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag1 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag1?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          _selectedimag2?.selectedFile != null
                              ? Container(
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
                                      image: DecorationImage(
                                          //  image: AssetImage('assets/Images/vincenzo.png'),
                                          image: FileImage(
                                              _selectedimag2!.selectedFile),
                                          fit: BoxFit.fill)),
                                  child: Stack(
                                    children: [
                                      _selectedimag2!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag2!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag2!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    _selectedimag2 =
                                                                        details
                                                                            .selectedFiles[0];
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                    print(
                                                                        'selectedByte ==> ${_selectedimag2?.selectedFile}');
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

                                                              /// On long tap, it will be available.
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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag2 =
                                                                  details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

                                                              /// On long tap, it will be available.
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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag2 =
                                                              details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                  ))
                              :Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
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
                                  ),
                              child: Stack(
                                children: [
                                  widget.image2.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image2}',) : CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image2}',    errorWidget: (context, url, error) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                      ),
                                    );
                                  },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
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
                                        image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag2 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag2 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source:
                                                          ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
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
                                                        if (details !=
                                                            null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag2 =
                                                          details
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
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          _selectedimag3?.selectedFile != null
                              ? Container(
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
                                      ),
                                  child: Stack(
                                    children: [
                                      _selectedimag3!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag3!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag3!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    _selectedimag3 =
                                                                        details
                                                                            .selectedFiles[0];
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                    print(
                                                                        'selectedByte ==> ${_selectedimag3?.selectedFile}');
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag3 =
                                                                  details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag3 =
                                                              details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                  ))
                              : Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
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
                              ),
                              child: Stack(
                                children: [
                                  widget.image3.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image3}',) : CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image3}',    errorWidget: (context, url, error) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: const DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                      ),
                                    );
                                  },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag3 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag3?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag3 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source:
                                                          ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

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
                                                        if (details !=
                                                            null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag3 =
                                                          details
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
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
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
                          _selectedimag4?.selectedFile != null
                              ? Container(
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
                                    ),
                                  child: Stack(
                                    children: [
                                      _selectedimag4!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag4!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag4!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    _selectedimag4 =
                                                                        details
                                                                            .selectedFiles[0];
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                    print(
                                                                        'selectedByte ==> ${_selectedimag4?.selectedFile}');
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag4 =
                                                                  details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag4 =
                                                              details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                  ))
                              : Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
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
                              ),
                              child: Stack(
                                children: [
                                  widget.image4.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image4}',) : CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image4}',    errorWidget: (context, url, error) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: const DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                      ),
                                    );
                                  },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag4 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag4?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.
                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag4 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source:
                                                          ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

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
                                                        if (details !=
                                                            null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag4 =
                                                          details
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
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          _selectedimag5?.selectedFile != null
                              ? Container(
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
                                      ),
                                  child: Stack(
                                    children: [
                                      _selectedimag5!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag5!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag5!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    _selectedimag5 =
                                                                        details
                                                                            .selectedFiles[0];
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                    print(
                                                                        'selectedByte ==> ${_selectedimag5?.selectedFile}');
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag5 =
                                                                  details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag5 =
                                                              details
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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                  ))
                              : Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
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
                              ),
                              child: Stack(
                                children: [
                                  widget.image5.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image5}',) : CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image5}',    errorWidget: (context, url, error) {
                                return Container(
                                  height: screenHeight(context,
                                      dividedBy: 8),
                                  width: screenHeight(context,
                                      dividedBy: 8),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15),
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
                                      image: const DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                  ),
                                );
                              },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag5 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag5 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag2?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source:
                                                          ImageSource
                                                              .gallery,

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
                                                        if (details !=
                                                            null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag5 =
                                                          details
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
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/add.png'),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          _selectedimag6?.selectedFile != null
                              ? Container(
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
                                     ),
                                  child: Stack(
                                    children: [
                                      _selectedimag6!.selectedFile.path.endsWith(".mp4") ?
                                      video(videoPath: _selectedimag6!.selectedFile,) :
                                      Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: DecorationImage(
                                              //  image: AssestImage('assets/Images/vincenzo.png'),
                                                image: FileImage(
                                                    _selectedimag6!.selectedFile),
                                                fit: BoxFit.cover)
                                        ),
                                      ),
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
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        height: 0,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
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
                                                              height:
                                                                  screenHeight(
                                                                      context,
                                                                      dividedBy:
                                                                          17),
                                                              width:
                                                                  screenWidth(
                                                                      context,
                                                                      dividedBy:
                                                                          2),
                                                              child:
                                                                  GestureDetector(
                                                                onTap:
                                                                    () async {
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
                                                                    source: ImageSource
                                                                        .camera,

                                                                    /// On long tap, it will be available.
                                                                    multiSelection:
                                                                        true,
                                                                    galleryDisplaySettings:
                                                                        GalleryDisplaySettings(
                                                                      appTheme: AppTheme(
                                                                          focusColor: Colors
                                                                              .white,
                                                                          primaryColor:
                                                                              Colors.black),
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
                                                                    _selectedimag6 =
                                                                        details
                                                                            .selectedFiles[0];
                                                                    Navigator.pop(
                                                                        context);
                                                                    setState(
                                                                        () {});
                                                                    print(
                                                                        'selectedByte ==> ${_selectedimag6?.selectedFile}');
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
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Camera',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                                picker =
                                                                ImagePickerPlus(
                                                                    context);
                                                            SelectedImagesDetails?
                                                                details =
                                                                await picker
                                                                    .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag6 = details.selectedFiles[0];

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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          right: screenWidth(
                                                                              context,
                                                                              dividedBy: 40)),
                                                                      height: screenHeight(
                                                                          context,
                                                                          dividedBy:
                                                                              40),
                                                                      width: screenWidth(
                                                                          context,
                                                                          dividedBy:
                                                                              15),
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                    ),
                                                                    const Text(
                                                                      'Photos',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColor.dropdownfont),
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
                                                        padding: EdgeInsets.symmetric(
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
                                                            ImagePickerPlus
                                                            picker =
                                                            ImagePickerPlus(
                                                                context);
                                                            SelectedImagesDetails?
                                                            details =
                                                            await picker
                                                                .pickVideo(
                                                              source:
                                                              ImageSource
                                                                  .gallery,

                                                              /// On long tap, it will be available.

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
                                                            if (details !=
                                                                null) {
                                                              //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                              _selectedimag6 = details.selectedFiles[0];

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
                                                                width:
                                                                    screenWidth(
                                                                        context,
                                                                        dividedBy:
                                                                            2),
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
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                              image:
                                                                                  DecorationImage(image: AssetImage('assets/Images/video.png'))),
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
                                  ))
                              : Container(
                              height: screenHeight(context,
                                  dividedBy: 8),
                              width: screenHeight(context,
                                  dividedBy: 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
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
                              ),
                              child: Stack(
                                children: [
                                  widget.image6.endsWith(".mp4") ? networkVideo(url: '${apis.baseurl}/${widget.image6}',) :
                                  CachedNetworkImage(imageUrl: '${apis.baseurl}/${widget.image6}',
                                    errorWidget: (context, url, error) {
                                     return Container(
                                        height: screenHeight(context,
                                            dividedBy: 8),
                                        width: screenHeight(context,
                                            dividedBy: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(15),
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
                                            image: const DecorationImage(image: AssetImage("assets/Images/placeHolderImage.jpg"),fit: BoxFit.cover)
                                        ),
                                      );
                                    },progressIndicatorBuilder: (context, url, progress) => Center(child: customLoader(),),
                                    imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: screenHeight(context,
                                          dividedBy: 8),
                                      width: screenHeight(context,
                                          dividedBy: 8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
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
                                          image: DecorationImage(image: imageProvider,fit: BoxFit.cover)
                                      ),
                                    );
                                  },),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: screenHeight(
                                                  context,
                                                  dividedBy: 3),
                                              decoration: const BoxDecoration(
                                                  color: AppColor
                                                      .white,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          15),
                                                      topRight: Radius
                                                          .circular(
                                                          16))),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            70)),
                                                    child:
                                                    const Text(
                                                      'Add Media',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'Roboto',
                                                          fontSize:
                                                          25,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 0,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: screenHeight(
                                                              context,
                                                              dividedBy:
                                                              17),
                                                          width: screenWidth(
                                                              context,
                                                              dividedBy:
                                                              2),
                                                          child:
                                                          GestureDetector(
                                                            onTap:
                                                                () async {
                                                              // final ImagePicker picker = ImagePicker();
                                                              // final image = picker.pickImage(source: ImageSource.gallery);
                                                              // print("image ===> $image");
                                                              ImagePickerPlus
                                                              picker =
                                                              ImagePickerPlus(context);
                                                              SelectedImagesDetails?
                                                              details =
                                                              await picker.pickBoth(
                                                                source:
                                                                ImageSource.camera,

                                                                /// On long tap, it will be available.
                                                                multiSelection:
                                                                true,
                                                                galleryDisplaySettings:
                                                                GalleryDisplaySettings(
                                                                  appTheme: AppTheme(focusColor: Colors.white, primaryColor: Colors.black),
                                                                  cropImage: true,
                                                                  showImagePreview: true,
                                                                ),
                                                              );
                                                              print(
                                                                  'Details ===> ${details}');
                                                              if (details !=
                                                                  null) {
                                                                // compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                                _selectedimag6 =
                                                                details.selectedFiles[0];
                                                                Navigator.pop(context);
                                                                setState(() {});
                                                                print('selectedByte ==> ${_selectedimag6?.selectedFile}');
                                                              }
                                                              // if (details != null) await displayDetails(details);
                                                            },
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/camera.png'))),
                                                                ),
                                                                const Text(
                                                                  'Camera',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickImage(
                                                          source: ImageSource
                                                              .gallery,
                                                          galleryDisplaySettings:
                                                          GalleryDisplaySettings(
                                                            appTheme: AppTheme(
                                                                focusColor:
                                                                Colors.white,
                                                                primaryColor: Colors.black),
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
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag6 =
                                                          details
                                                              .selectedFiles[0];
                                                          Navigator.pop(
                                                              context);
                                                          setState(
                                                                  () {});
                                                          print(
                                                              'selectedByte ==> ${_selectedimag6?.selectedFile}');
                                                        }
                                                        // if (details != null) await displayDetails(details);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height: screenHeight(context, dividedBy: 40),
                                                                  width: screenWidth(context, dividedBy: 15),
                                                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/placeholder.png'))),
                                                                ),
                                                                const Text(
                                                                  'Photos',
                                                                  style: TextStyle(fontFamily: 'Roboto', fontSize: 17, fontWeight: FontWeight.w500, color: AppColor.dropdownfont),
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
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: screenWidth(
                                                            context,
                                                            dividedBy:
                                                            15),
                                                        vertical: screenHeight(
                                                            context,
                                                            dividedBy:
                                                            100)),
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        ImagePickerPlus
                                                        picker =
                                                        ImagePickerPlus(
                                                            context);
                                                        SelectedImagesDetails?
                                                        details =
                                                        await picker
                                                            .pickVideo(
                                                          source:
                                                          ImageSource
                                                              .gallery,

                                                          /// On long tap, it will be available.

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
                                                        if (details !=
                                                            null) {
                                                          //compressToHighQuality(File(details.selectedFiles[0].toString()));
                                                          _selectedimag6 = details.selectedFiles[0];

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
                                                            height: screenHeight(
                                                                context,
                                                                dividedBy:
                                                                17),
                                                            width: screenWidth(
                                                                context,
                                                                dividedBy:
                                                                2),
                                                            child:
                                                            Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                  EdgeInsets.only(right: screenWidth(context, dividedBy: 40)),
                                                                  height:
                                                                  screenHeight(context, dividedBy: 40),
                                                                  width:
                                                                  screenWidth(context, dividedBy: 15),
                                                                  decoration:
                                                                  const BoxDecoration(image: DecorationImage(image: AssetImage('assets/Images/video.png'))),
                                                                ),
                                                                const Text(
                                                                  'Videos',
                                                                  style: TextStyle(
                                                                      fontFamily: 'Roboto',
                                                                      fontSize: 17,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: AppColor.dropdownfont),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: screenHeight(
                                            context,
                                            dividedBy: 30),
                                        width: screenHeight(context,
                                            dividedBy: 30),
                                        decoration: const BoxDecoration(
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomRight: Radius
                                                    .circular(
                                                    12)),
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
                                    if(widget.file4.isNotEmpty && widget.file5.isNotEmpty && widget.file6.isNotEmpty){
                                      flutterToast("Please remove atlest 1 pdf/document", false);
                                    }
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      // allowMultiple: true,
                                      allowedExtensions: ['jpg', 'pdf', 'doc'],
                                    );
                                    print("result === >" + result!.names.toString());
                                    if(widget.file4.isEmpty && _files1 == false ){
                                      file1 = result.files.first;
                                      fileName1 = result.names.first ?? '';
                                      _files1 = true;
                                      setState(() {});
                                      print("123");
                                    } else
                                    if(widget.file5.isEmpty && _files2 == false ){
                                      file2 = result.files.first;
                                      fileName2 = result.names.first ?? '';
                                      _files2 = true;
                                      setState(() {});
                                      print("456");
                                    } else
                                    if(widget.file6.isEmpty && _files3 == false ){
                                      file3 = result.files.first;
                                      fileName3 = result.names.first ?? '';
                                      _files3 = true;
                                      setState(() {});
                                      print("678");
                                    }
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
                              Column(
                                children: [
                                 _files1 ? file1 != null ?  GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                       return pdfviewshow(
                                           pdfUrl:file1?.path ?? '');
                                     },));
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only(
                                         top: screenHeight(context,
                                             dividedBy: 100)),
                                     height:
                                     screenHeight(context, dividedBy: 15),
                                     width: screenWidth(context, dividedBy: 1.3),
                                     decoration: BoxDecoration(
                                         color: const Color(0xffEFF4FF),
                                         borderRadius: BorderRadius.circular(6)),
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
                                                 Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                   children: [
                                                     Text(
                                                       fileName1.length >= 35 ?"${fileName1.substring(0,30)}...":fileName1,
                                                       style: const TextStyle(
                                                           fontFamily: 'Roboto',
                                                           fontSize: 12,
                                                           fontWeight:
                                                           FontWeight.w500,
                                                           color: AppColor
                                                               .dropdownfont),
                                                     ),
                                                     const Text(
                                                       '96.47 KB',
                                                       style: TextStyle(
                                                           fontFamily: 'Roboto',
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
                                                             SimpleDialog(
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
                                                                           _files1 = !_files1;
                                                                           setState(() {});
                                                                           Navigator.pop(context);
                                                                         },
                                                                         child: Container(
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
                                                             )
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
                                   ),
                                 ) :  const SizedBox() : widget.file4.isNotEmpty ?  GestureDetector(
                onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pdfview( pdfUrl: '${apis.baseurl}/${widget.file4}',);
              },));
              },
                child: Container(
                  margin: EdgeInsets.only(
                      top: screenHeight(context,
                          dividedBy: 100)),
                  height:
                  screenHeight(context, dividedBy: 15),
                  width: screenWidth(context, dividedBy: 1.3),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFF4FF),
                      borderRadius: BorderRadius.circular(6)),
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
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fileName1.length >= 35 ?"${fileName1.substring(0,30)}...":fileName1,
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.w500,
                                        color: AppColor
                                            .dropdownfont),
                                  ),
                                  const Text(
                                    '96.47 KB',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
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
                                          SimpleDialog(
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
                                                        _files1 = !_files1;
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
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
                                          )
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
                ),
              ) :  const SizedBox(),
                                 _files2 ? file2 != null ?  GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                       return pdfviewshow(
                                           pdfUrl:file2?.path ?? '');
                                     },));
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only(
                                         top: screenHeight(context,
                                             dividedBy: 100)),
                                     height:
                                     screenHeight(context, dividedBy: 15),
                                     width: screenWidth(context, dividedBy: 1.3),
                                     decoration: BoxDecoration(
                                         color: const Color(0xffEFF4FF),
                                         borderRadius: BorderRadius.circular(6)),
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
                                                 Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                   children: [
                                                     Text(
                                                       fileName2.length >= 35 ?"${fileName2.substring(0,30)}...":fileName2,
                                                       style: const TextStyle(
                                                           fontFamily: 'Roboto',
                                                           fontSize: 12,
                                                           fontWeight:
                                                           FontWeight.w500,
                                                           color: AppColor
                                                               .dropdownfont),
                                                     ),
                                                     const Text(
                                                       '96.47 KB',
                                                       style: TextStyle(
                                                           fontFamily: 'Roboto',
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
                                                             SimpleDialog(
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
                                                                           _files2 = !_files2;
                                                                           setState(() {});
                                                                           Navigator.pop(context);
                                                                         },
                                                                         child: Container(
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
                                                             )
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
                                   ),
                                 ) :  const SizedBox() : widget.file5.isNotEmpty ? GestureDetector(
                onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pdfview( pdfUrl: '${apis.baseurl}/${widget.file5}',);
              },));
              },
                child: Container(
                  margin: EdgeInsets.only(
                      top: screenHeight(context,
                          dividedBy: 100)),
                  height:
                  screenHeight(context, dividedBy: 15),
                  width: screenWidth(context, dividedBy: 1.3),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFF4FF),
                      borderRadius: BorderRadius.circular(6)),
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
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fileName2.length >= 35 ?"${fileName2.substring(0,30)}...":fileName2,
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.w500,
                                        color: AppColor
                                            .dropdownfont),
                                  ),
                                  const Text(
                                    '96.47 KB',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
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
                                          SimpleDialog(
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
                                                        _files2 = !_files2;
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
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
                                          )
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
                ),
              ) :  const SizedBox(),
                                 _files3 ? file3 != null ?  GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                                       return pdfviewshow(
                                           pdfUrl:file3?.path ?? '');
                                     },));
                                   },
                                   child: Container(
                                     margin: EdgeInsets.only(
                                         top: screenHeight(context,
                                             dividedBy: 100)),
                                     height:
                                     screenHeight(context, dividedBy: 15),
                                     width: screenWidth(context, dividedBy: 1.3),
                                     decoration: BoxDecoration(
                                         color: const Color(0xffEFF4FF),
                                         borderRadius: BorderRadius.circular(6)),
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
                                                 Column(
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment.start,
                                                   mainAxisAlignment:
                                                   MainAxisAlignment.center,
                                                   children: [
                                                     Text(
                                                       fileName3.length >= 35 ?"${fileName3.substring(0,30)}...":fileName3,
                                                       style: const TextStyle(
                                                           fontFamily: 'Roboto',
                                                           fontSize: 12,
                                                           fontWeight:
                                                           FontWeight.w500,
                                                           color: AppColor
                                                               .dropdownfont),
                                                     ),
                                                     const Text(
                                                       '96.47 KB',
                                                       style: TextStyle(
                                                           fontFamily: 'Roboto',
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
                                                             SimpleDialog(
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
                                                                           _files3 = !_files3;
                                                                           setState(() {});
                                                                           Navigator.pop(context);
                                                                         },
                                                                         child: Container(
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
                                                             )
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
                                   ),
                                 ) :  const SizedBox() : widget.file6.isNotEmpty ? GestureDetector(
                onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pdfview( pdfUrl: '${apis.baseurl}/${widget.file6}',);
              },));
              },
                child: Container(
                  margin: EdgeInsets.only(
                      top: screenHeight(context,
                          dividedBy: 100)),
                  height:
                  screenHeight(context, dividedBy: 15),
                  width: screenWidth(context, dividedBy: 1.3),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFF4FF),
                      borderRadius: BorderRadius.circular(6)),
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
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    fileName3.length >= 35 ?"${fileName3.substring(0,30)}...":fileName3,
                                    style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.w500,
                                        color: AppColor
                                            .dropdownfont),
                                  ),
                                  const Text(
                                    '96.47 KB',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
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
                                          SimpleDialog(
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
                                                        _files3 = !_files3;
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
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
                                          )
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
                ),
              ) :  const SizedBox(),
                                ],
                              )
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

                      BlocBuilder<BusinessprofileupdateCubit,BusinessprofileupdateState>(builder: (context, state) {
                        if(state is BusinessprofileupdateLoading){
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: screenHeight(context, dividedBy: 20)),
                            child: Center(child: customLoader(),),
                          );
                        }
                        return Custom_botton(
                          context,
                          text: 'SAVE',
                          onTap: () {
                            businessprofileupdateCubit
                                .BusinessprofileupdateService(
                                photo_1: _selectedimag1?.selectedFile ?? File(''),
                                bio: _bio.text,
                                file_2: file2 ?? PlatformFile(name: "", size: 0),
                                file_3: file3 ?? PlatformFile(name: "", size: 0),
                                context: context,
                                photo_2: _selectedimag2?.selectedFile ?? File(''),
                                photo_3: _selectedimag3?.selectedFile ?? File(''),
                                photo_4: _selectedimag4?.selectedFile ?? File(''),
                                photo_5: _selectedimag5?.selectedFile ?? File(''),
                                photo_6: _selectedimag6?.selectedFile ?? File(''),
                                file_1: file1 ?? PlatformFile(name: "", size: 0)).then((value) => Navigator.pop(context,'refresh'));
                          },
                          height: screenHeight(context, dividedBy: 20),
                        );
                      },)
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
class networkVideo extends StatefulWidget {
  final String url;
  const networkVideo({super.key,required this.url});

  @override
  State<networkVideo> createState() => _networkVideoState();
}

class _networkVideoState extends State<networkVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        setState(() {
          // _controller.setVolume(0);
          // _controller.play();
          // _controller.setLooping(true); // Auto-repeating the video
        });
      });
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context,
          dividedBy: 8),
      width: screenHeight(context,
          dividedBy: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: AppColor.gray,
            offset: Offset(
              1,
              1,
            ),
            blurRadius: 5,
            // spreadRadius: 1.0,
          ),
        ],
      ),
      child: _controller.value.isInitialized ?  ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: VideoPlayer(_controller)) : Center(child: customLoader(),),
    );
  }
}
