import 'dart:convert';
import 'dart:developer';
import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:pair_me/Screen_Pages/videocall.dart';
import 'package:pair_me/Screen_Pages/voice_call.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/cubits/accept_req_msg_user.dart';
import 'package:pair_me/cubits/block_req_msg_user.dart';
import 'package:pair_me/cubits/delete_msg_users.dart';
import 'package:pair_me/cubits/reject_user.dart';
import 'package:pair_me/helper/Apis.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Chatting_Page extends StatefulWidget {
  String name, Username, image, id, uid;

  Chatting_Page(
      {super.key,
      required this.name,
      required this.uid,
      required this.id,
      required this.Username,
      required this.image});

  @override
  State<Chatting_Page> createState() => _Chatting_PageState();
}

class _Chatting_PageState extends State<Chatting_Page> {
  ScrollController scrollController = ScrollController();
  Dio dio = Dio();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  TextEditingController messageController = TextEditingController();
  RemoveMsgUserCubit removeMsgUserCubit = RemoveMsgUserCubit();
  AcceptReqMsgUserCubit acceptReqMsgUserCubit = AcceptReqMsgUserCubit();
  RejectUserCubit rejectUserCubit = RejectUserCubit();
  BlockUserCubit blockUserCubit = BlockUserCubit();
  late ChatClient agoraChatClient;
  final List messageList = [];
  List<Media> mediaList = [];
  bool showCard = false;
  bool emojiShowing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupChatClient();
    setupListeners();
    setState(() {});
  }

  @override
  void dispose() {
    ChatClient.getInstance.chatManager.removeEventHandler('UNIQUE_HANDLER_ID');
    ChatClient.getInstance.chatManager.removeMessageEvent('UNIQUE_HANDLER_ID');
    ChatClient.getInstance.logout(true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.name == 'chatting'
          ? const SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      blockUserCubit.AcceptNotification(id: widget.id)
                          .then((value) => Navigator.pop(context, "refresh"));
                      // rejectUserCubit.GetRejectUser(id: widget.id).then((value) => );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeight(context, dividedBy: 40)),
                      height: screenHeight(context, dividedBy: 20),
                      width: screenWidth(context, dividedBy: 3.7),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                4,
                              ),
                              blurRadius: 11,
                              spreadRadius: 0.0,
                            ),
                          ]),
                      child: Text(
                        'Block'.tr(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: Color(0xffFF0000)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      removeMsgUserCubit.DeleteReqUser(context, id: widget.id)
                          .then((value) => Navigator.pop(context, "refresh"));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeight(context, dividedBy: 40)),
                      height: screenHeight(context, dividedBy: 20),
                      width: screenWidth(context, dividedBy: 3.7),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                4,
                              ),
                              blurRadius: 11,
                              spreadRadius: 0.0,
                            ),
                          ]),
                      child: Text(
                        'Delete'.tr(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: Color(0xffFF0000)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      acceptReqMsgUserCubit.AcceptNotification(context,id: widget.id);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeight(context, dividedBy: 40)),
                      height: screenHeight(context, dividedBy: 20),
                      width: screenWidth(context, dividedBy: 3.7),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(23),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.fontgray,
                              offset: Offset(
                                0,
                                4,
                              ),
                              blurRadius: 11,
                              spreadRadius: 0.0,
                            ),
                          ]),
                      child: Text(
                        'Accept'.tr(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: Color(0xff1D1D1D)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight(context, dividedBy: 9),
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColor.skyBlue, AppColor.whiteskyBlue])),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth(context, dividedBy: 15),
                      right: screenWidth(context, dividedBy: 15),
                      top: screenHeight(context, dividedBy: 25),
                      bottom: screenHeight(context, dividedBy: 60),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColor.white,
                            )),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 35),
                        ),
                        SizedBox(
                          height: screenHeight(context, dividedBy: 17),
                          width: screenHeight(context, dividedBy: 17),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: screenHeight(context, dividedBy: 20),
                                width: screenHeight(context, dividedBy: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${apis.baseurl}/${widget.image}"),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high),
                                    border: Border.all(
                                        color: AppColor.white, width: 1),
                                    shape: BoxShape.circle),
                              ),
                              widget.name == 'Request'
                                  ? const SizedBox()
                                  : Positioned(
                                      bottom: 3.0,
                                      left: 3.0,
                                      child: Container(
                                        height: screenHeight(context,
                                            dividedBy: 80),
                                        width: screenHeight(context,
                                            dividedBy: 80),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff04D364),
                                            border: Border.all(
                                                color: AppColor.white,
                                                width: 1),
                                            shape: BoxShape.circle),
                                      ))
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 95),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.Username,
                              style: const TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto'),
                            ),
                            widget.name == 'Request'
                                ? Text(
                                    'Just Joined'.tr(),
                                    style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto'),
                                  )
                                : Text(
                                    'online'.tr(),
                                    style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto'),
                                  ),
                          ],
                        ),
                        const Spacer(),
                        widget.name == 'Request'
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const VoiceCallPage();
                                    },
                                  ));
                                },
                                child: Image(
                                  image: const AssetImage(
                                      'assets/Images/call.png'),
                                  height: screenHeight(context, dividedBy: 40),
                                  width: screenHeight(context, dividedBy: 40),
                                ),
                              ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 25),
                        ),
                        widget.name == 'Request'
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return const VideoCallPage();
                                    },
                                  ));
                                },
                                child: Image(
                                  image: const AssetImage(
                                      'assets/Images/videoCall.png'),
                                  height: screenHeight(context, dividedBy: 35),
                                  width: screenHeight(context, dividedBy: 30),
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: (_, index) {
                      return messageList[index];
                    },
                    itemCount: messageList.length,
                  ),
                  //      // ListView.builder(itemBuilder: (context, index) {
                  //      //
                  //      // },),
                  //  SingleChildScrollView(
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25)),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Container(
                  //           margin: EdgeInsets.only(
                  //               top: screenHeight(context,dividedBy: 100)),
                  //           width: screenWidth(context, dividedBy: 1.5),
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(16),
                  //                   topRight: Radius.circular(16),
                  //                   topLeft: Radius.circular(16)),
                  //               color: Color(0xffE8E8E8)),
                  //           child: Padding(
                  //             padding:
                  //             EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                  //             child: const Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w500,
                  //                       fontFamily: 'Roboto',
                  //                       color: Color(0xff606164)),
                  //                 ),
                  //                 Text(
                  //                   '01:32 PM',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Roboto',
                  //                       fontWeight: FontWeight.w500,
                  //                       fontSize: 10,
                  //                       color: Color(0xff4A4A4A)),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(
                  //             left: screenWidth(context,dividedBy: 1.82),
                  //               top: screenHeight(context,dividedBy: 100)),
                  //          // width: screenWidth(context, dividedBy: 2),
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomLeft: Radius.circular(16),
                  //                   topRight: Radius.circular(16),
                  //                   topLeft: Radius.circular(16)),
                  //               color: Color(0xff437DFF)),
                  //           child: Padding(
                  //             padding:
                  //             EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                  //             child: const Column(
                  //               crossAxisAlignment: CrossAxisAlignment.end,
                  //               children: [
                  //                 Text(
                  //                   'Hey, how are you?',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w500,
                  //                       fontFamily: 'Roboto',
                  //                       color: AppColor.white),
                  //                 ),
                  //                 Text(
                  //                   '01:32 PM',
                  //                   style: TextStyle(
                  //                       fontFamily: 'Roboto',
                  //                       fontWeight: FontWeight.w500,
                  //                       fontSize: 10,
                  //                       color: AppColor.white),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.only(
                  //               top: screenHeight(context,dividedBy: 100)),
                  //           width: screenWidth(context, dividedBy: 1.5),
                  //           decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(16),
                  //                   topRight: Radius.circular(16),
                  //                   topLeft: Radius.circular(16)),
                  //               color: Color(0xffE8E8E8)),
                  //           child: Padding(
                  //             padding:
                  //             EdgeInsets.all(screenWidth(context, dividedBy: 30)),
                  //             child: const Column(
                  //               crossAxisAlignment: CrossAxisAlignment.end,
                  //               children: [
                  //                 Text(
                  //                   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                  //                   style: TextStyle(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.w500,
                  //                       fontFamily: 'Roboto',
                  //                       color: Color(0xff606164)),
                  //                 ),
                  //                 Text(
                  //                   '01:32 PM',
                  //                   textAlign: TextAlign.end,
                  //                   style: TextStyle(
                  //                       fontFamily: 'Roboto',
                  //                       fontWeight: FontWeight.w500,
                  //                       fontSize: 10,
                  //                       color: Color(0xff4A4A4A)),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ),
                showCard
                    ? Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth(context, dividedBy: 15),
                        ),
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: AppColor.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                spreadRadius: 0.0,
                              ),
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenWidth(context, dividedBy: 15),
                                  vertical:
                                      screenHeight(context, dividedBy: 100)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height:
                                        screenHeight(context, dividedBy: 17),
                                    width: screenWidth(context, dividedBy: 2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: screenWidth(context,
                                                  dividedBy: 40)),
                                          height: screenHeight(context,
                                              dividedBy: 40),
                                          width: screenWidth(context,
                                              dividedBy: 15),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Images/camera.png'))),
                                        ),
                                        const Text(
                                          'Camera',
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
                            const Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenWidth(context, dividedBy: 15),
                                  vertical:
                                      screenHeight(context, dividedBy: 100)),
                              child: GestureDetector(
                                onTap: () async {
                                  showModalBottomSheet(context: context, builder: (context) {
                                    return MediaPicker(
                                      onPicked: (selectedList){
                                        print(selectedList.single.file);
                                        print(selectedList.single.thumbnail);
                                        print(selectedList.single.id);
                                        print(selectedList.single.index);
                                        print(selectedList.single.mediaType);
                                        print(selectedList.single.size);
                                        var msg = ChatMessage.createImageSendMessage(
                                          targetId: widget.id,
                                          filePath: selectedList.first.file!.path,
                                          sendOriginalImage: true,
                                          chatType: ChatType.Chat,
                                        );
                                        ChatClient.getInstance.chatManager.addMessageEvent(
                                          "UNIQUE_HANDLER_ID",
                                          ChatMessageEvent(
                                            onSuccess: (msgId, msg) {
                                              print(" ============================> $msgId");
                                              print(" ============================> $msg");
                                              print(msg);
                                              setState(() => mediaList = selectedList);
                                              displayimgMessage(mediaList[0].thumbnail!,true);
                                              Navigator.pop(context);
                                            //  messageController.clear();
                                             // setState(() {});
                                              // messageBoxController.clear();
                                              // _addLogToConsole("on message succeed");
                                            },
                                            onProgress: (msgId, progress) {
                                              print(" ============================> $msgId");
                                              //_addLogToConsole("on message progress");
                                            },
                                            onError: (msgId, msg, error) {
                                              print(" ============================> $error  === $msg");
                                              // _addLogToConsole(
                                              //   "on message failed, code: ${error.code}, desc: ${error.description}",
                                              // );
                                            },
                                          ),
                                        );
                                        // ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
                                        agoraChatClient.chatManager.sendMessage(msg);
                                      },
                                      onCancel: ()=> print('Canceled'),
                                      mediaCount: MediaCount.single,
                                      decoration: PickerDecoration(), mediaList: [],
                                    );
                                  },);
                                },
                                child: SizedBox(
                                  height:
                                      screenHeight(context, dividedBy: 17),
                                  width: screenWidth(context, dividedBy: 1.2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: screenWidth(context,
                                                dividedBy: 40)),
                                        height: screenHeight(context,
                                            dividedBy: 40),
                                        width: screenWidth(context,
                                            dividedBy: 15),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/Images/placeholder.png'))),
                                      ),
                                      const Text(
                                        'Photos & Videos',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.dropdownfont),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenWidth(context, dividedBy: 15),
                                  vertical:
                                      screenHeight(context, dividedBy: 100)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height:
                                        screenHeight(context, dividedBy: 17),
                                    width: screenWidth(context, dividedBy: 2),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              'assets/Images/file.png'),
                                          height: screenHeight(context,
                                              dividedBy: 30),
                                          width: screenWidth(context,
                                              dividedBy: 15),
                                          color: Color(0xff5D5D5D),
                                        ),
                                        SizedBox(
                                          width: screenWidth(context,
                                              dividedBy: 50),
                                        ),
                                        const Text(
                                          'Document',
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
                          ],
                        ),
                      )
                    : const SizedBox(),
                widget.name == 'Request'
                    ? const SizedBox()
                    : Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          right: screenWidth(context, dividedBy: 15),
                          left: screenWidth(context, dividedBy: 15),
                          bottom: screenHeight(context, dividedBy: 30),
                          top: screenHeight(context, dividedBy: 55),
                        ),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(9),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                spreadRadius: 0.0,
                              ),
                            ]),
                        child: TextField(
                          onTap: () {
                            emojiShowing = false;
                            setState(() {});
                          },
                          // onChanged: (msg) => messageContent = msg,
                          controller: messageController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Message...',
                              hintStyle: const TextStyle(
                                  color: Color(0xff888888),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400),
                              prefixIcon: IconButton(
                                splashRadius: 1,
                                style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent)),
                               // onPressed: sendMessage,
                                onPressed: Smsg,
                                icon: Container(
                                  height: screenHeight(context, dividedBy: 30),
                                  width: screenWidth(context, dividedBy: 20),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/Images/send.png'))),
                                ),
                              ),
                              suffixIcon: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      emojiShowing = !emojiShowing;
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: screenWidth(context,
                                              dividedBy: 40),
                                          left: screenWidth(context,
                                              dividedBy: 300)),
                                      height:
                                          screenHeight(context, dividedBy: 30),
                                      width:
                                          screenWidth(context, dividedBy: 20),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/emoji.png'))),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showCard = !showCard;
                                      });
                                    },
                                    child: Container(
                                      height:
                                          screenHeight(context, dividedBy: 30),
                                      width:
                                          screenWidth(context, dividedBy: 20),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/Images/pin.png'))),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            screenWidth(context, dividedBy: 30),
                                        left: screenWidth(context,
                                            dividedBy: 40)),
                                    height:
                                        screenHeight(context, dividedBy: 30),
                                    width: screenWidth(context, dividedBy: 30),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/Images/mic.png'))),
                                  ),
                                ],
                              )),
                        ),
                      ),
                Offstage(
                    offstage: !emojiShowing,
                    child: SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          textEditingController: messageController,
                          // config: Config(
                          //   columns: 7,
                          //   emojiSizeMax: 32 *
                          //       (foundation.defaultTargetPlatform ==
                          //               TargetPlatform.android
                          //           ? 1.30
                          //           : 1.0),
                          //   verticalSpacing: 0,
                          //   horizontalSpacing: 0,
                          //   gridPadding: EdgeInsets.zero,
                          //   initCategory: Category.RECENT,
                          //   bgColor: const Color(0xFFF2F2F2),
                          //   indicatorColor: Colors.blue,
                          //   iconColor: Colors.grey,
                          //   iconColorSelected: Colors.blue,
                          //   backspaceColor: Colors.blue,
                          //   skinToneDialogBgColor: Colors.white,
                          //   skinToneIndicatorColor: Colors.grey,
                          //   enableSkinTones: true,
                          //   recentsLimit: 28,
                          //   replaceEmojiOnLimitExceed: false,
                          //   noRecents: const Text(
                          //     'No Recents',
                          //     style: TextStyle(
                          //         fontSize: 20, color: Colors.black26),
                          //     textAlign: TextAlign.center,
                          //   ),
                          //   loadingIndicator: const SizedBox.shrink(),
                          //   tabIndicatorAnimDuration: kTabScrollDuration,
                          //   categoryIcons: const CategoryIcons(),
                          //   buttonMode: ButtonMode.MATERIAL,
                          //   checkPlatformCompatibility: true,
                          // ),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showLog(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void setupChatClient() async {
    print("id===> ${widget.id}");
    print("id===> ${widget.uid}");
    ChatOptions options = ChatOptions(
      appKey: AgoraAppkey,
      autoLogin: false,
    );
    agoraChatClient = ChatClient.getInstance;
    await agoraChatClient.init(options);
      await ChatClient.getInstance.startCallback();
      try {
        await agoraChatClient.login(widget.uid, "123");
        showLog("Logged in successfully as ${widget.uid}");
      } on ChatError catch (e) {
        if (e.code == 200) {
          // Already logged in
        } else {
          showLog("Login failed, code: ${e.code}, desc: ${e.description}");
        }
      }
  }

  void setupListeners() {
    agoraChatClient.addConnectionEventHandler(
      "CONNECTION_HANDLER",
      ConnectionEventHandler(
          onConnected: onConnected,
          onDisconnected: onDisconnected,
          onTokenWillExpire: onTokenWillExpire,
          onTokenDidExpire: onTokenDidExpire),
    );

    agoraChatClient.chatManager.addEventHandler(
      "MESSAGE_HANDLER",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
    setState(() {});
  }

  void onMessagesReceived(List<ChatMessage> messages) {
    for (var msg in messages) {
      if (msg.to == widget.uid && msg.from == widget.id) {
        print("message ====> ${msg.to}");
        if (msg.body.type == MessageType.TXT) {
          ChatTextMessageBody body = msg.body as ChatTextMessageBody;
          displayMessage(body.content, false);
          showLog("Message from ${msg.from}");
        } else {
          String msgType = msg.body.type.name;
          log("Received $msgType message, from ${msg}");
        }
      }
    }
  }

  void onTokenWillExpire() {
    // The token is about to expire. Get a new token
    // from the token server and renew the token.
  }

  void onTokenDidExpire() {
    // The token has expired
  }

  void onDisconnected() {
    // Disconnected from the Chat server
  }

  void onConnected() {
    showLog("Connected");
  }

  void displayMessage(String text, bool isSentMessage) {
    messageList.add(Row(
      mainAxisAlignment:
          isSentMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            //alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
                top: screenHeight(context, dividedBy: 100),
                right: 15,
                left: isSentMessage ? screenWidth(context, dividedBy: 7) : 15),
            //width: screenWidth(context, dividedBy: 1.5),
            decoration: BoxDecoration(
                borderRadius: isSentMessage
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                        topLeft: Radius.circular(26))
                    : const BorderRadius.only(
                        bottomRight: Radius.circular(26),
                        topRight: Radius.circular(26),
                        topLeft: Radius.circular(26)),
                color: isSentMessage ? AppColor.skyBlue : AppColor.gray),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 30),
                  vertical: screenWidth(context, dividedBy: 50)),
              child: Column(
                crossAxisAlignment: isSentMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15,
                        // height: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: isSentMessage
                            ? AppColor.white
                            : AppColor.dropdownfont),
                  ),
                  Text(
                    '01:32 PM',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: isSentMessage
                            ? AppColor.white
                            : AppColor.dropdownfont),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
    setState(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    });
  }
  void displayimgMessage(final thumbnail,bool isSentMessage) {
    messageList.add(Row(
      mainAxisAlignment:
          isSentMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            //alignment: Alignment.centerRight,
            margin: EdgeInsets.only(
                top: screenHeight(context, dividedBy: 100),
                right: 15,
                left: isSentMessage ? screenWidth(context, dividedBy: 7) : 15),
            //width: screenWidth(context, dividedBy: 1.5),
            decoration: BoxDecoration(
                borderRadius: isSentMessage
                    ? const BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                        topLeft: Radius.circular(26))
                    : const BorderRadius.only(
                        bottomRight: Radius.circular(26),
                        topRight: Radius.circular(26),
                        topLeft: Radius.circular(26)),
                color: isSentMessage ? AppColor.skyBlue : AppColor.gray),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: isSentMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: screenHeight(context,dividedBy: 5),
                    width: screenWidth(context,dividedBy: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: MemoryImage(thumbnail),fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    '01:32 PM',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: isSentMessage
                            ? AppColor.white
                            : AppColor.dropdownfont),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
    setState(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
    });
  }

  void sendMessage() async {

    print("call me");
    if(messageController.text.isNotEmpty){
      var msg = ChatMessage.createTxtSendMessage(
        targetId: widget.id,
        content: messageController.text,
      );
      ChatClient.getInstance.chatManager.addMessageEvent(
        "UNIQUE_HANDLER_ID",
        ChatMessageEvent(
          onSuccess: (msgId, msg) {
            print(" ============================> $msgId");
            print(" ============================> $msg");
            print(msg);
            displayMessage(messageController.text, true);
            messageController.clear();
            setState(() {});
            // messageBoxController.clear();
            // _addLogToConsole("on message succeed");
          },
          onProgress: (msgId, progress) {
            print(" ============================> $msgId");
            //_addLogToConsole("on message progress");
          },
          onError: (msgId, msg, error) {
            print(" ============================> $error  === $msg");
            // _addLogToConsole(
            //   "on message failed, code: ${error.code}, desc: ${error.description}",
            // );
          },
        ),
      );
      // ChatClient.getInstance.chatManager.removeMessageEvent("UNIQUE_HANDLER_ID");
      agoraChatClient.chatManager.sendMessage(msg);
    }
  }
  Future<void> Smsg() async {

    final dio = Dio();
    Map<String, dynamic> body = {
      "msg_id": "1244785340619688906",
      "from": widget.uid,
      "to": widget.id,
      "chat_type": "chat",
      // "body":{
      //   "msg":"import message."
      // },
    };
    print("Body is $body");
    try {
      // print(widget.id);
      // print(widget.uid);
     // final response = await dio.post("https://a61.chat.agora.io/611031492/1280036/messages/users",options:  Options(headers: {
      final response = await dio.get("https://a61.chat.agora.io/611031492/1280036/chatmessages/2018112717",options:  Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer 007eJxTYDiQfuvMDnXnsxXaUgyPfrG4Xvx5SH2Do6PpnGP8Z+afFzyvwGBumJicZJKYaGSZbGxinGRpaWhimmJokpqclGpknGyY9m75kdSGQEaGVW+uMjAysAIxEwOIz8AAAPXlIGs=",
      }));
      print("Response ===> ${response.data}");
    } on Exception catch (e) {
      print("fail ====> " +e.toString());

      // TODO
    }
  }
}




