import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/cubits/delete_msg_users.dart';
import 'package:pair_me/cubits/show_message_requests.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class MessageRequest extends StatefulWidget {
  const MessageRequest({super.key});

  @override
  State<MessageRequest> createState() => _MessageRequestState();
}

class _MessageRequestState extends State<MessageRequest> {
  AllMessageRequestCubit messageRequestCubit = AllMessageRequestCubit();
  RemoveMsgUserCubit removeMsgUserCubit = RemoveMsgUserCubit();
  List list = [
    {
      "Name":"Jane Koblenz",
      "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU"
    },
    {
      "Name":"Virat Kohli",
      "image":"https://wallpapers.com/images/hd/virat-kohli-hd-black-tuxedo-fibgrtdlqvatdblj.jpg"
    },
    {
      "Name":"Hardik Pandeya",
      "image":"https://i.pinimg.com/originals/2e/31/a4/2e31a4fce6c52a98d518053d269d7eba.jpg"
    },
    {
      "Name":"Amitabh Bachchan",
      "image":"https://e1.pxfuel.com/desktop-wallpaper/85/759/desktop-wallpaper-%E2%9C%85-8-amitabh-bachchan-amitabh-bachchan-thumbnail.jpg"
    },
    {
      "Name":"Vincenzo cassano",
      "image":"https://e0.pxfuel.com/wallpapers/251/76/desktop-wallpaper-vincenzo-cassano-thumbnail.jpg"
    },
    {
      "Name":"Shahrukh khan",
      "image":"https://e0.pxfuel.com/wallpapers/531/653/desktop-wallpaper-shah-rukh-khan-actor-king-gentleman-shahrukhkhan-attitude.jpg"
    },
    {
      "Name":"Robert Downey jr",
      "image":"https://static.wikia.nocookie.net/ironman/images/7/79/Photo%28906%29.jpg/revision/latest?cb=20141019122536"
    },
    {
      "Name":"Johnny Depp",
      "image":"https://images.saymedia-content.com/.image/t_share/MTc0NDI1MDExOTk2NTk5OTQy/top-10-greatest-johnny-depp-movies-of-all-time.jpg"
    },
    {
      "Name":"úrsula corberó",
      "image":"https://www.bollywoodhungama.com/wp-content/uploads/2021/09/WhatsApp-Image-2021-09-23-at-10.45.54-AM.jpeg"
    },
    {
      "Name":"Satoru Gojo",
      "image":"https://e0.pxfuel.com/wallpapers/666/451/desktop-wallpaper-white-hair-blue-eyes-satoru-gojo-jujutsu-kaisen.jpg"
    },
    {
      "Name":"Nanami Kento",
      "image":"https://wallpaperaccess.com/full/5661539.png"
    },
    {
      "Name":"Ryomen Sukuna",
      "image":"https://i1.sndcdn.com/artworks-Ovrge2921kVbhGxA-m3FQYA-t500x500.jpg"
    },
    {
      "Name":"Vijay Thalapathy",
      "image":"https://static.toiimg.com/photo/101080781.cms"
    },
    {
      "Name":"Yash",
      "image":"https://img.mensxp.com/media/content/2021/Jan/Lesser-Known-Facts-About-Yash-7_60056adf8c66e.jpeg?w=900&h=1200&cc=1"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageRequestCubit = BlocProvider.of<AllMessageRequestCubit>(context);
    removeMsgUserCubit = BlocProvider.of<RemoveMsgUserCubit>(context);
    messageRequestCubit.GetAllMessageRequest();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          removeMsgUserCubit.DeleteAllReqUser(context).then((value) {
            messageRequestCubit.GetAllMessageRequest();
          },);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
              vertical: screenHeight(context, dividedBy: 40)),
          height: screenHeight(context, dividedBy: 20),
          width: screenWidth(context, dividedBy: 2.5),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(33),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    0,
                    4,
                  ),
                  blurRadius: 11,
                  spreadRadius: 0.0,
                ),
              ]),
          child:  Text(
            'Delete all'.tr(),
            style:const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
                color: Color(0xffFF0000)),
          ),
        ),
      ),
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SafeArea(
                child: Column(
              children: [
                Header_Space(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(context, dividedBy: 15)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image(
                          image: const AssetImage('assets/Images/back.png'),
                          fit: BoxFit.contain,
                          height: screenHeight(context, dividedBy: 45),
                          width: screenHeight(context, dividedBy: 40),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 25),
                      ),
                       Text(
                        'Message requests'.tr(),
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 150),
                ),
               BlocBuilder<AllMessageRequestCubit,AllMessageRequestState>(builder: (context, state) {
                 print(state);
                 if(state is AllMessageRequestSuccess) {
                   return Expanded(
                       child: messageRequestCubit.userMssageReq.data?.withoutConnect == null  || messageRequestCubit.userMssageReq.data?.withoutConnect?.length == 0 ? Center(
                         child: Container(
                           height: screenHeight(context,dividedBy: 5),
                           width: screenHeight(context,dividedBy: 5),
                           decoration: const BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
                           ),
                         ),
                       ) :ListView.separated(
                           physics: const ClampingScrollPhysics(),
                           padding: EdgeInsets.only(
                             bottom: screenHeight(context, dividedBy: 100),),
                           itemBuilder: (context, index) {
                             return   Dismissible(
                                 direction: DismissDirection.endToStart,
                                 key: UniqueKey(),
                                 onDismissed: (direction) {
                                   removeMsgUserCubit.DeleteReqUser(context, id: messageRequestCubit.userMssageReq.data?.withoutConnect?[index].id ?? '').then((value) {
                                     messageRequestCubit.GetAllMessageRequest();
                                   },);
                                 },
                                 background: Container(
                                   padding: EdgeInsets.only(
                                       right: screenWidth(context,
                                           dividedBy: 10)),
                                   color: AppColor.skyBlue,
                                   alignment: Alignment.centerRight,
                                   child: Container(
                                     height: screenHeight(
                                         context, dividedBy: 35),
                                     width: screenWidth(context, dividedBy: 15),
                                     decoration: const BoxDecoration(
                                         image: DecorationImage(
                                             image: AssetImage(
                                                 'assets/Images/delete.png'))
                                     ),
                                   ),
                                 ),
                                 child: InkWell(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(
                                       builder: (context) {
                                         return Chatting_Page(name: 'Request',
                                           Username: messageRequestCubit.userMssageReq.data?.withoutConnect?[index].userName ?? '',
                                           image: messageRequestCubit.userMssageReq.data?.withoutConnect?[index].userImage ?? '',);
                                       },
                                     ));
                                   },
                                   child: SizedBox(
                                     // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                                     height: screenHeight(
                                         context, dividedBy: 10),
                                     width: screenHeight(context),
                                     child: Padding(
                                       padding: EdgeInsets.symmetric(
                                         horizontal: screenWidth(
                                             context, dividedBy: 17),),
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment
                                             .start,
                                         crossAxisAlignment: CrossAxisAlignment
                                             .center,
                                         children: [
                                           CachedNetworkImage(
                                             imageUrl: "${apis
                                                 .baseurl}/${messageRequestCubit
                                                 .userMssageReq.data?.withoutConnect?[index]
                                                 .userImage ?? ''}",
                                             imageBuilder: (context,
                                                 imageProvider) =>
                                                 Container(
                                                   height: screenHeight(
                                                       context, dividedBy: 15),
                                                   width: screenHeight(
                                                       context, dividedBy: 15),
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
                                                 CircularProgressIndicator(),
                                             errorWidget: (context, url,
                                                 error) =>
                                                 CircleAvatar(
                                                     radius: screenHeight(
                                                         context,
                                                         dividedBy: 30),
                                                     child: Icon(Icons.person)),
                                           ),
                                           SizedBox(width: screenWidth(
                                               context, dividedBy: 30),),
                                           Padding(
                                             padding: EdgeInsets.symmetric(
                                                 vertical: screenWidth(
                                                     context, dividedBy: 40)),
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment
                                                   .start,
                                               crossAxisAlignment: CrossAxisAlignment
                                                   .start,
                                               children: [
                                                 Text(messageRequestCubit.userMssageReq.data?.withoutConnect?[index].userName ?? '',
                                                   style: const TextStyle(
                                                       fontSize: 15,
                                                       fontWeight: FontWeight
                                                           .w500,
                                                       fontFamily: 'Roboto'),),
                                                 SizedBox(height: screenHeight(
                                                     context, dividedBy: 300),),
                                                 SizedBox(
                                                   width: screenWidth(
                                                       context, dividedBy: 2.2),
                                                   child: const Text(
                                                       'Duis protium gravida denim, vei maximus ligula......',
                                                       maxLines: 2,
                                                       style: TextStyle(
                                                           color: Color(
                                                               0xffAAAAAA),
                                                           fontSize: 12,
                                                           fontWeight: FontWeight
                                                               .w400,
                                                           fontFamily: 'Roboto')),
                                                 )
                                               ],
                                             ),
                                           ),
                                           const Spacer(),
                                           Padding(
                                             padding: EdgeInsets.symmetric(
                                                 vertical: screenWidth(
                                                     context, dividedBy: 40)),
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment
                                                   .start,
                                               children: [
                                                 const Text('2 min',
                                                   style: TextStyle(
                                                       fontFamily: 'Roboto',
                                                       fontWeight: FontWeight
                                                           .w400,
                                                       fontSize: 12,
                                                       color: Color(
                                                           0xffAAAAAA)),),
                                                 SizedBox(height: screenHeight(
                                                     context, dividedBy: 70),),
                                                 Container(
                                                   alignment: Alignment.center,
                                                   height: screenHeight(
                                                       context, dividedBy: 90),
                                                   width: screenHeight(
                                                       context, dividedBy: 90),
                                                   decoration: const BoxDecoration(
                                                       shape: BoxShape.circle,
                                                       color: AppColor.skyBlue
                                                     // borderRadius: BorderRadius.circular(3),
                                                     // gradient:LinearGradient(
                                                     //     begin: Alignment.topLeft,
                                                     //     end: Alignment.bottomCenter,
                                                     //     colors: [AppColor.skyBlue,AppColor.whiteskyBlue]
                                                     // )
                                                   ),
                                                   //  child: Text('2',style: TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto',fontSize: 7)),
                                                 )
                                               ],
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                 )
                             );
                           },
                           separatorBuilder: (context, index) {
                             return const Divider(
                               height: 0,
                               thickness: 2,
                               color: Color(0xffF5F5F5),
                               // color: Colors.black12,
                             );
                           },
                           itemCount: messageRequestCubit.userMssageReq.data?.withoutConnect?.length ?? 0));
                 }
                 if(state is AllMessageRequestLoading){
                   return Expanded(child: customLoader());
                 }
                 if(state is AllMessageRequestError){
                   return Expanded(
                     child: Center(
                       child: Container(
                         height: screenHeight(context,dividedBy: 5),
                         width: screenHeight(context,dividedBy: 5),
                         decoration: const BoxDecoration(
                             image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
                         ),
                       ),
                     ),
                   );
                 }
                 return SizedBox();
               },)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
