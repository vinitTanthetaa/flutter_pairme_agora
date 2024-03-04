import 'dart:convert';
import 'dart:developer';

import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pair_me/Modal/message_modal.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Screen_Pages/message_request.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/cubits/delete_msg_users.dart';
import 'package:pair_me/cubits/message_data_cubit.dart';
import 'package:pair_me/cubits/onlineoflinestatus_cubit.dart';
import 'package:pair_me/cubits/show_message_requests.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Message_page extends StatefulWidget {
  const Message_page({super.key});

  @override
  State<Message_page> createState() => _Message_pageState();
}

class _Message_pageState extends State<Message_page> {
  MessageCubit messageCubit = MessageCubit();
  UserMessage userMessage = UserMessage();
  RemoveMsgUserCubit removeMsgUserCubit = RemoveMsgUserCubit();
  AllMessageRequestCubit messageRequestCubit = AllMessageRequestCubit();
  OnlineOfflinestatusCubit onlineOfflinestatusCubit = OnlineOfflinestatusCubit();
  late ChatClient agoraChatClient;
  Map data = {};
  List ids = [];
  getData() async {
    userMessage = await messageCubit.GetMessage() ?? UserMessage();
     setupChatClient();
    // setupListeners();
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messageCubit = BlocProvider.of<MessageCubit>(context);
    removeMsgUserCubit = BlocProvider.of<RemoveMsgUserCubit>(context);
    messageRequestCubit = BlocProvider.of<AllMessageRequestCubit>(context);
    onlineOfflinestatusCubit = BlocProvider.of<OnlineOfflinestatusCubit>(context);
    messageRequestCubit.GetAllMessageRequest();
    getData();
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
             SafeArea(child: Column(
               children: [
                 Header_Space(context),
                 Padding(
                   padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       custom_header(text: 'Message'),
                       BlocBuilder<MessageCubit,MessageState>(builder: (context, state) {
                         bool data = messageRequestCubit.userMssageReq.data?.withoutConnect?.isNotEmpty ?? false;
                         if(state is MessageSuccess){
                           return   data ?  GestureDetector(
                             onTap: () async {
                               String refresh = await  Navigator.push(context, MaterialPageRoute(builder:(context) {
                                 return const MessageRequest();
                               },));
                               if(refresh == "refresh"){
                                 getData();
                                 messageRequestCubit.GetAllMessageRequest();
                                 setState(() {});
                               }
                             },
                             child: Row(
                               children: [
                                 Text('Requests'.tr(),style: const TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: AppColor.skyBlue),),
                                 Text('(${messageRequestCubit.userMssageReq.data?.withoutConnect?.length ?? 0})',style: const TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: AppColor.skyBlue),),
                               ],
                             ),) : const SizedBox();
                         }
                         return const SizedBox();
                       },),
                     ],
                   ),
                 ),
                 SizedBox(height: screenHeight(context,dividedBy: 100),),
                 Expanded(
                     child: BlocBuilder<MessageCubit,MessageState>(builder: (context, state) {
                       if(state is MessageError){
                         return Center(
                           child: Container(
                             height: screenHeight(context,dividedBy: 5),
                             width: screenHeight(context,dividedBy: 5),
                             decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
                             ),
                           ),
                         );
                       }
                       if(state is MessageLoading){
                         return Expanded(child: Center(child: customLoader()));
                       }
                       if(state is MessageSuccess){
                         return userMessage.data == null || userMessage.data?.data?.length  == 0 ?     Center(
                           child: Container(
                             height: screenHeight(context,dividedBy: 5),
                             width: screenHeight(context,dividedBy: 5),
                             decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
                             ),
                           ),
                         ) :
                         ListView.separated(
                             physics: const ClampingScrollPhysics(),
                             padding: EdgeInsets.only(bottom:screenHeight(context,dividedBy: 100), ),
                             itemBuilder: (context, index) {
                               return  Dismissible(
                                   direction: DismissDirection.endToStart,
                                   onDismissed: (direction) {
                                     removeMsgUserCubit.DeleteUser(context, id: userMessage.data?.data?[index].id ?? '').then((value) {
                                     },);
                                   },
                                   key: UniqueKey(),
                                   background: Container(
                                     padding: EdgeInsets.only(
                                         right: screenWidth(context,
                                             dividedBy: 10)),
                                     color: AppColor.skyBlue,
                                     alignment: Alignment.centerRight,
                                     child: Container(
                                       height: screenHeight(context,dividedBy: 35),
                                       width: screenWidth(context,dividedBy: 15),
                                       decoration:  const BoxDecoration(
                                           image: DecorationImage(image: AssetImage('assets/Images/delete.png'))
                                       ),
                                     ) ,
                                   ),
                                   child: InkWell(
                                     onTap: () async {
                                        String  refresh = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                                           onlineOfflinestatusCubit.OnlineStatus(context, id: userMessage.data?.data?[index].id ?? '');
                                           return Chatting_Page(name: 'chatting', status: userMessage.data?.data?[index].status ?? '',CUName: "",Username:userMessage.data?.data?[index].userName ?? '', image: userMessage.data?.data?[index].userImage ?? '', id: userMessage.data?.data?[index].id ?? '', uid:  userMessage.data?.userId ?? '',);
                                         },));
                                       if(refresh == "refresh"){
                                         ids.clear();
                                         getData();
                                         onlineOfflinestatusCubit.OfflineStatus(context, id: userMessage.data?.data?[index].id ?? '');
                                         setState(() {});
                                       }
                                     },
                                     child: SizedBox(
                                       // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                                       height: screenHeight(context,dividedBy: 8.5),
                                       width: screenHeight(context),
                                       child: Padding(
                                         padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 17),),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             CachedNetworkImage(
                                               imageUrl: "${apis.baseurl}/${userMessage.data?.data?[index].userImage ?? ''}",
                                               imageBuilder: (context, imageProvider) => Container(
                                                 height: screenHeight(context,dividedBy: 15),
                                                 width: screenHeight(context,dividedBy: 15),
                                                 decoration: BoxDecoration(
                                                   image: DecorationImage(
                                                     image: imageProvider,
                                                   fit: BoxFit.cover,
                                                     // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                                   ),
                                                   shape: BoxShape.circle,
                                                 ),
                                               ),
                                               placeholder: (context, url) => const CircularProgressIndicator(),
                                               errorWidget: (context, url, error) => CircleAvatar(
                                                   radius: screenHeight(context,dividedBy:30),
                                                   child: const Icon(Icons.person)),
                                             ),
                                             // Container(
                                             //   height: screenHeight(context,dividedBy: 15),
                                             //   width: screenHeight(context,dividedBy: 15),
                                             //   decoration: BoxDecoration(
                                             //       shape: BoxShape.circle,
                                             //       image: DecorationImage(image: NetworkImage("${list[index]["image"]}"),fit: BoxFit.cover)
                                             //   ),
                                             // ),
                                             SizedBox(width: screenWidth(context,dividedBy: 30),),
                                             Padding(
                                               padding: EdgeInsets.symmetric(vertical: screenWidth(context,dividedBy: 40)),
                                               child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   Text(userMessage.data?.data?[index].userName ?? '',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
                                                   SizedBox(height: screenHeight(context,dividedBy: 300),),
                                                   SizedBox(
                                                     width: screenWidth(context,dividedBy: 2.2),
                                                     child: Text(ids.contains(userMessage.data?.data?[index].id ?? '') ? ids[index]['msg'] :'Duis protium gravida denim, vei maximus ligula......',maxLines: 2,style: TextStyle(color: Color(0xffAAAAAA),overflow: TextOverflow.ellipsis,fontSize: 12,fontWeight: FontWeight.w400,fontFamily: 'Roboto')),
                                                   )
                                                 ],
                                               ),
                                             ),
                                             const Spacer(),
                                             Padding(
                                               padding: EdgeInsets.symmetric(vertical: screenWidth(context,dividedBy: 40)),
                                               child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                 children: [
                                                   const Text('2 min',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xffAAAAAA)),),
                                                   SizedBox(height: screenHeight(context,dividedBy: 70),),
                                                   Container(
                                                     alignment: Alignment.center,
                                                     height: screenHeight(context,dividedBy: 90),
                                                     width: screenHeight(context,dividedBy: 90),
                                                     decoration: const BoxDecoration(
                                                       //borderRadius: BorderRadius.circular(3),
                                                         shape: BoxShape.circle,
                                                         color: AppColor.skyBlue
                                                       // gradient:LinearGradient(
                                                       //     begin: Alignment.topLeft,
                                                       //     end: Alignment.bottomCenter,
                                                       //     colors: [AppColor.skyBlue,AppColor.whiteskyBlue]
                                                       // )
                                                     ),
                                                     // child: Text('2',style: TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto',fontSize: 7)),
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
                               return  const Divider(
                                 height: 0,
                                 thickness: 2,
                                 color: Color(0xffF5F5F5),
                                 // color: Colors.black12,
                               );
                             },
                             itemCount: userMessage.data?.data?.length ?? 0);
                       }
                       return Center(
                         child: Container(
                           height: screenHeight(context,dividedBy: 7),
                           width: screenHeight(context,dividedBy: 7),
                           color: Colors.green,
                           decoration: const BoxDecoration(
                               image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
                           ),
                         ),
                       );
                     },)
                 )
               ],
             )),
          ],
        ),
      ),
    );
  }
  void setupChatClient() async {

    ChatOptions options = ChatOptions(
      appKey: AgoraAppkey,
      autoLogin: false,
    );
    agoraChatClient = ChatClient.getInstance;
    await agoraChatClient.init(options);
    await ChatClient.getInstance.startCallback();
    try {
      await agoraChatClient.login(userMessage.data?.userId ?? '', "123");
      print("Logged in successfully as ${userMessage.data?.userId ?? ''}");

    } on ChatError catch (e) {
      if (e.code == 200) {
        // Already logged in
      } else {
        print("Login failed, code: ${e.code}, desc: ${e.description}");
      }
    }
    int lenth = userMessage.data?.data?.length ?? 0;
    for (int i = 0; i <= lenth-1; i++) {
     data = await Getdata(userMessage.data?.data?[i].id ?? '');
     ids.add(data);
    }
  }
  Future Getdata(String id) async {
    final result =
    await ChatClient.getInstance.chatManager.fetchHistoryMessages(
        conversationId: id,
        pageSize: 1,
        type: ChatConversationType.Chat
    );
    log(" data ===> ${result.data}");
      if(result.data.last.body.type == MessageType.TXT){
        ChatTextMessageBody body = result.data.last.body as ChatTextMessageBody;
        data["from"] = result.data.last.from;
        data["to"] = result.data.last.to;
        data["msg"] = body.content;
      } else
      if(result.data.last.body.type == MessageType.IMAGE){
        data["from"] = result.data.last.from;
        data["to"] = result.data.last.to;
        data["msg"] = "image";
      } else
      if(result.data.last.body.type == MessageType.VIDEO){
        data["from"] = result.data.last.from;
        data["to"] = result.data.last.to;
        data["msg"] = "video";
      } else
      if(result.data.last.body.type == MessageType.FILE){
        data["from"] = result.data.last.from;
        data["to"] = result.data.last.to;
        data["msg"] = "file";
      }else
      if(result.data.last.body.type == MessageType.VOICE){
        data["from"] = result.data.last.from;
        data["to"] = result.data.last.to;
        data["msg"] = "voice";
      }
    print("ids ====> $data");
      return data;
  }
  void setupListeners() {
    agoraChatClient.addConnectionEventHandler(
      "CONNECTION_HANDLER",
      ConnectionEventHandler(
          onConnected: () {

          },
          onDisconnected: () {

          },
          onTokenWillExpire: () {

          },
          onTokenDidExpire: () {

          },),
    );

    agoraChatClient.
    chatManager.addEventHandler(
      "MESSAGE_HANDLER",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
    setState(() {});
  }
  void onMessagesReceived(List<ChatMessage> messages) {
    log("message ===>? $messages");
    // for (var msg in messages) {
    //   if (msg.to == widget.uid && msg.from == widget.id) {
    //     print("message ====> ${msg.to}");
    //     if (msg.body.type == MessageType.TXT) {
    //       ChatTextMessageBody body = msg.body as ChatTextMessageBody;
    //       messageList.add( displayMessage(text: body.content, isSentMessage: false,));
    //       setState(() {
    //         scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    //       });
    //       // showLog("Message from ${msg.from}");
    //     }
    //     if(msg.body.type == MessageType.IMAGE){
    //       ChatImageMessageBody body = msg.body as ChatImageMessageBody;
    //       displayimgMessage(body.remotePath, false);
    //       setState(() {
    //         scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    //       });
    //       // showLog("Message from ${msg.from}");
    //     }
    //     if(msg.body.type == MessageType.VIDEO){
    //       ChatVideoMessageBody body = msg.body as ChatVideoMessageBody;
    //       displayvideoMessage(body.remotePath, false);
    //       setState(() {
    //         scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    //       });
    //       // showLog("Message from ${msg.from}");
    //     }
    //     if(msg.body.type == MessageType.FILE){
    //       ChatFileMessageBody body = msg.body as ChatFileMessageBody;
    //       displayfileMessage(body.remotePath,body.displayName.toString(),false);
    //       setState(() {
    //         scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    //       });
    //       // showLog("Message from ${msg.from}");
    //     }
    //     if(msg.body.type == MessageType.VOICE){
    //       ChatVoiceMessageBody body = msg.body as ChatVoiceMessageBody;
    //       messageList.add( displayvoiceMessage(dispalname:body.displayName.toString() ,isSentMessage: false,thumbnail: body.remotePath.toString(),));
    //       setState(() {
    //         scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    //       });
    //       // showLog("Message from ${msg.from}");
    //     }
    //   }
    // }
  }

}
class Storedata {
  String from;
  String to;
  String msg;
  Storedata({required this.from, required this.to,required this.msg});
}