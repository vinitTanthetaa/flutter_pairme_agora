import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_me/Modal/notification_modal.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/cubits/acceptORrejectnotification.dart';
import 'package:pair_me/cubits/clearAllNotification_cubit.dart';
import 'package:pair_me/cubits/notification_cubit.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({super.key});

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  NotificationCubit notificationCubit = NotificationCubit();
  UserNotification userNotification = UserNotification();
  AcceptorRejectCubit acceptorRejectCubit = AcceptorRejectCubit();
  ClearAllNotificationCubit clearAllNotificationCubit = ClearAllNotificationCubit();
  List ids = [];
//   List list = [
//   {
//     "Name":"Jane Koblenz",
//     "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU"
//   },
//   {
//     "Name":"Virat Kohli",
//     "image":"https://wallpapers.com/images/hd/virat-kohli-hd-black-tuxedo-fibgrtdlqvatdblj.jpg"
//   },
//   {
//     "Name":"Hardik Pandeya",
//     "image":"https://i.pinimg.com/originals/2e/31/a4/2e31a4fce6c52a98d518053d269d7eba.jpg"
//   },
//   {
//     "Name":"Amitabh Bachchan",
//     "image":"https://e1.pxfuel.com/desktop-wallpaper/85/759/desktop-wallpaper-%E2%9C%85-8-amitabh-bachchan-amitabh-bachchan-thumbnail.jpg"
//   },
//   {
//     "Name":"Vincenzo cassano",
//     "image":"https://e0.pxfuel.com/wallpapers/251/76/desktop-wallpaper-vincenzo-cassano-thumbnail.jpg"
//   },
//   {
//     "Name":"Shahrukh khan",
//     "image":"https://e0.pxfuel.com/wallpapers/531/653/desktop-wallpaper-shah-rukh-khan-actor-king-gentleman-shahrukhkhan-attitude.jpg"
//   },
//   {
//     "Name":"Robert Downey jr",
//     "image":"https://static.wikia.nocookie.net/ironman/images/7/79/Photo%28906%29.jpg/revision/latest?cb=20141019122536"
//   },
//   {
//     "Name":"Johnny Depp",
//     "image":"https://images.saymedia-content.com/.image/t_share/MTc0NDI1MDExOTk2NTk5OTQy/top-10-greatest-johnny-depp-movies-of-all-time.jpg"
//   },
//   {
//     "Name":"úrsula corberó",
//     "image":"https://www.bollywoodhungama.com/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-23-at-10.45.54-AM.jpeg"
//   },
//   {
//     "Name":"Satoru Gojo",
//     "image":"https://e0.pxfuel.com/wallpapers/666/451/desktop-wallpaper-white-hair-blue-eyes-satoru-gojo-jujutsu-kaisen.jpg"
//   },
//   {
//     "Name":"Nanami Kento",
//     "image":"https://wallpaperaccess.com/full/5661539.png"
//   },
//   {
//     "Name":"Ryomen Sukuna",
//     "image":"https://i1.sndcdn.com/artworks-Ovrge2921kVbhGxA-m3FQYA-t500x500.jpg"
//   },
//   {
//     "Name":"Vijay Thalapathy",
//     "image":"https://static.toiimg.com/photo/101080781.cms"
//   },
//   {
//     "Name":"Yash",
//     "image":"https://img.mensxp.com/media/content/2021/Jan/Lesser-Known-Facts-About-Yash-7_60056adf8c66e.jpeg?w=900&h=1200&cc=1"
//   },
// ];
  getData()  {
    notificationCubit.GetNotification();
    int lenth =  notificationCubit.userNotification.data?.length ?? 0;
    for(int i=0; i <= lenth-1; i++){
      ids.add(notificationCubit.userNotification.data![i].sentBy?.id);
    }
    print("ids $ids");
    // print("ids ===> $ids");
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationCubit = BlocProvider.of<NotificationCubit>(context);
    acceptorRejectCubit = BlocProvider.of<AcceptorRejectCubit>(context);
    clearAllNotificationCubit = BlocProvider.of<ClearAllNotificationCubit>(context);
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width:screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SafeArea(
              child: Column(
                children: [
                  Header_Space(context),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        custom_header(text: 'Notification'),
                        GestureDetector(
                          onTap: () {
                            acceptorRejectCubit.RejectNotification(id: ids).whenComplete(() {
                              getData();
                            },);
                          },
                            child: Text('Clear all'.tr(),style: const TextStyle(fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.skyBlue),))
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight(context,dividedBy: 70),),
                  Expanded(
                     child: BlocBuilder<NotificationCubit,NotificationState>(builder: (context, state) {
                       if(state is NotificationLoading){
                         return Expanded(child: Center(child: customLoader()));
                       }
                       if(state is NotificationError){
                         return Center(
                           child: Container(
                             height: screenHeight(context,dividedBy: 5),
                             width: screenHeight(context,dividedBy: 5),
                             decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/Images/Nonotification.png'))
                             ),
                           ),
                         );
                       }
                       if(state is NotificationSuccess){
                         return notificationCubit.userNotification.data == null || notificationCubit.userNotification.data?.length == 0 ? Center(
                           child: Container(
                             height: screenHeight(context,dividedBy: 5),
                             width: screenHeight(context,dividedBy: 5),
                             decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/Images/Nonotification.png'))
                             ),
                           ),
                         ) : ListView.separated(
                             physics: const ClampingScrollPhysics(),
                             padding: EdgeInsets.only(bottom:screenHeight(context,dividedBy: 100), ),
                             itemBuilder: (context, index) {
                               return  SizedBox(
                                 // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                                 height:
                                 screenHeight(context, dividedBy: 8),
                                 width: screenHeight(context),
                                 child: Padding(
                                   padding: EdgeInsets.symmetric(
                                     horizontal: screenWidth(context,
                                         dividedBy: 30),
                                   ),
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.start,
                                     crossAxisAlignment:
                                     CrossAxisAlignment.center,
                                     children: [
                                       CachedNetworkImage(
                                         imageUrl: "${apis.baseurl}/${notificationCubit.userNotification.data?[index].sentBy?.image}",
                                         imageBuilder:
                                             (context, imageProvider) =>
                                             Container(
                                               height: screenHeight(context,
                                                   dividedBy: 15),
                                               width: screenHeight(context,
                                                   dividedBy: 15),
                                               decoration: BoxDecoration(
                                                 image: DecorationImage(
                                                   image: imageProvider,
                                                   fit: BoxFit.cover,

                                                   // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                                 ),
                                                 shape: BoxShape.circle,
                                               ),
                                             ),
                                         placeholder: (context, url) =>
                                         const CircularProgressIndicator(),
                                         errorWidget:
                                             (context, url, error) =>
                                             CircleAvatar(
                                                 radius: screenHeight(
                                                     context,
                                                     dividedBy: 30),
                                                 child: const Icon(
                                                     Icons.person)),
                                       ),
                                       SizedBox(
                                         width: screenWidth(context,
                                             dividedBy: 30),
                                       ),
                                       Padding(
                                         padding: EdgeInsets.symmetric(
                                             vertical: screenWidth(context,
                                                 dividedBy: 40)),
                                         child: Column(
                                           mainAxisAlignment:
                                           MainAxisAlignment.start,
                                           crossAxisAlignment:
                                           CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                               notificationCubit.userNotification.data?[index].sentBy?.userName ?? '',
                                               style: const TextStyle(
                                                   fontSize: 15,
                                                   fontWeight:
                                                   FontWeight.w500,
                                                   fontFamily: 'Roboto'),
                                             ),
                                             SizedBox(
                                               height: screenHeight(
                                                   context,
                                                   dividedBy: 300),
                                             ),
                                             SizedBox(
                                               width: screenWidth(context,
                                                   dividedBy: 2.2),
                                               child:  Text(
                                                   notificationCubit.userNotification.data?[index].message ?? '',
                                                   maxLines: 2,
                                                   style: const TextStyle(
                                                       color: Color(
                                                           0xffAAAAAA),
                                                       fontSize: 12,
                                                       fontWeight:
                                                       FontWeight.w400,
                                                       fontFamily:
                                                       'Roboto')),
                                             ),
                                             SizedBox(
                                               height: screenHeight(
                                                   context,
                                                   dividedBy: 70),
                                             ),
                                             SizedBox(
                                                 width: screenWidth(
                                                     context,
                                                     dividedBy: 2.2),
                                                 child: Text(
                                                     notificationCubit.userNotification.data?[index].time ?? '',
                                                     style: const TextStyle(
                                                         color: Color(
                                                             0xffAAAAAA),
                                                         fontSize: 10,
                                                         fontWeight:
                                                         FontWeight
                                                             .w400,
                                                         fontFamily:
                                                         'Roboto'))),
                                           ],
                                         ),
                                       ),
                                       const Spacer(),
                                       Padding(
                                           padding: EdgeInsets.symmetric(
                                               vertical: screenWidth(
                                                   context,
                                                   dividedBy: 40)),
                                           child: Row(
                                             children: [
                                               GestureDetector(
                                                 onTap: () {
                                                   acceptorRejectCubit.RejectNotification(id: [notificationCubit.userNotification.data?[index].sentBy?.id ?? '']).whenComplete(() {
                                                     getData();
                                                   },);
                                                 },
                                                 child: SvgPicture.asset(
                                                     "assets/Images/cancel.svg",
                                                     width: screenWidth(
                                                         context,
                                                         dividedBy: 15)),
                                               ),
                                               SizedBox(
                                                 width: screenWidth(
                                                     context,
                                                     dividedBy: 25),
                                               ),
                                               GestureDetector(
                                                 onTap: () {
                                                   acceptorRejectCubit.AcceptNotification(id: notificationCubit.userNotification.data?[index].sentBy?.id ?? '').whenComplete(() {
                                                     getData();
                                                   },);
                                                 },
                                                 child: SvgPicture.asset(
                                                     "assets/Images/accept.svg",
                                                     width: screenWidth(
                                                         context,
                                                         dividedBy: 15)),
                                               ),
                                             ],
                                           ))
                                     ],
                                   ),
                                 ),
                               );
                             },
                             separatorBuilder: (context, index) {
                               return  const Divider(
                                 height: 0,
                                 thickness: 2,
                                 color: Color(0xffF5F5F5),
                                 // color: Colors.black12,
                               );
                             },
                             itemCount: notificationCubit.userNotification.data?.length ?? 0);
                       }
                       return Expanded(child: Center(child: customLoader()));
                     },)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
