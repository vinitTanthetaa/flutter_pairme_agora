import 'dart:convert';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/cubits/GenrateToken.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallPage extends StatefulWidget {
  String img,name,uid,id;

   VideoCallPage({super.key,required this.img,required this.name,required this.uid,required this.id});

  @override
  State<VideoCallPage> createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  late Map<String, dynamic> config; // Configuration parameters
  int localUid = -1;
  String appId = "", channelName = "";
  List<int> remoteUids = []; // Uids of remote users in the channel
  bool isJoined = false; // Indicates if the local user has joined the channel
  bool isBroadcaster = true; // Client role
  RtcEngine agoraEngine = createAgoraRtcEngine(); // Agora engine instance
  GenerateTokenCubit generateTokenCubit = GenerateTokenCubit();
  bool  mic = false;
  final dio = Dio();

  createchannel() async {
    Map<String, dynamic> body = {
      "channel": widget.uid.toString(),
    };
    try {
      final response = await dio.post('http://192.168.29.113:3000/rtc',data: jsonEncode(body));
      print(response);
    } catch (e) {
      print("you are fully fail my friend " + e.toString());
      // TODO
    }
  }
  Future<void> setupAgoraEngine() async {
    // Retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();
    await agoraEngine.initialize(RtcEngineContext(appId: AgoraAppid));
    await agoraEngine.enableVideo();
    await agoraEngine.enableAudio();
    print("======================================> ${widget.uid} <============================ ");
    agoraEngine.registerEventHandler(getEventHandler());
    generateTokenCubit.GenerateTokenService(product: widget.uid, context: context).then((value) {
      join();
    });
  }
  void  join() async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    agoraEngine.renewToken(Rtctoken);
    print("token ===> $Rtctoken}");
    print("chanel ===> ${widget.uid}");
    print(Rtctoken);
    await agoraEngine.joinChannel(
      channelId: widget.uid,
      options: options,
      uid: 0,
      // token: "00671acb4aa29c343b99145d14ecbe23c1fIACPKvVXYuBlhh6pcuMj0Rm+g+ZrLdO2I+CaNt+8Y5dI9Yd2L5oAAAAAIgAHr3uoe+7rZQQAAQAQDgAAAgAQDgAAAwAQDgAABAAQDgAA",
      token: Rtctoken,
      // token: '007eJxTYHi7XuXIz10Rj9PNDnm1fsrYEuCg/cH4pVNs9JVMgYjdmWkKDOaGiclJJomJRpbJxibGSZaWhiamKYYmqclJqUbGyYZpCaYvUhsCGRkunHFnZGSAQBBfgsHMNDnVwNjCwCTVzMAg0cLEwjDZ0tQ8NZWBAQCR2SWr',
    );
  }
  RtcEngineEventHandler getEventHandler() {
    return RtcEngineEventHandler(
      onError: (err, msg) {
        print("error ==> ${err.name} and message ==> ${msg.toString()}");
      },
      // Occurs when the network connection state changes
      onConnectionStateChanged: (RtcConnection connection, ConnectionStateType state, ConnectionChangedReasonType reason) {
        if (reason == ConnectionChangedReasonType.connectionChangedLeaveChannel) {
          remoteUids.clear();
          isJoined = false;
        }
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection.channelId;
        eventArgs["state"] = state.name;
        eventArgs["reason"] = reason.name;
        print("eventArgs1 ===> $eventArgs");
       // eventCallback("onConnectionStateChanged", eventArgs);
      },
      // Occurs when a local user joins a channel
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        isJoined = true;
      //  messageCallback(
        //    "Local user uid:${connection.localUid} joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection.localUid;
        eventArgs["elapsed"] = elapsed;
        print("eventArgs2 ===> $eventArgs");
       // eventCallback("onJoinChannelSuccess", eventArgs);
      },
      // Occurs when a remote user joins the channel
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        setState(() {
          remoteUids.add(remoteUid);
        });
        print("remoteUids ===> $remoteUids");
       // messageCallback("Remote user uid:$remoteUid joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["remoteUid"] = remoteUid;
        eventArgs["elapsed"] = elapsed;
        print("eventArgs3 ===> $eventArgs");
      //  eventCallback("onUserJoined", eventArgs);
      },
      // Occurs when a remote user leaves the channel
      onUserOffline: (RtcConnection connection, int remoteUid,
          UserOfflineReasonType reason) {
        remoteUids.remove(remoteUid);
        print("remoteUids ===> $remoteUids");
        leave();
       // messageCallback("Remote user uid:$remoteUid left the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["remoteUid"] = remoteUid;
        eventArgs["reason"] = reason;
        print("eventArgs4 ===> $eventArgs");
       // eventCallback("onUserOffline", eventArgs);
      },
    );
  }
  AgoraVideoView remoteVideoView(int remoteUid) {
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: agoraEngine,
        canvas: VideoCanvas(uid: remoteUid),
        connection: RtcConnection(channelId: channelName),
      ),
    );
  }
  AgoraVideoView localVideoView() {
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: agoraEngine,
        canvas: const VideoCanvas(uid: 0), // Use uid = 0 for local view
      ),
    );
  }
  Future<void> leave() async {
    // Clear saved remote Uids
    remoteUids.clear();

    // Leave the channel
      await agoraEngine.leaveChannel();

    isJoined = false;

    // Destroy the Agora engine instance
    destroyAgoraEngine();
  }
  void destroyAgoraEngine() {
    // Release the RtcEngine instance to free up resources
      agoraEngine.release();
      agoraEngine.leaveChannel();
      Navigator.pop(context);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    createchannel();
    setupAgoraEngine();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    destroyAgoraEngine();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          color: AppColor.whiteskyBlue,
          child: Stack(
            children: [
              SizedBox(
                height: screenHeight(context),
                width: screenWidth(context),
                child: remoteUids.isEmpty ? const Center(child: Text("Waiting...",style: TextStyle(color: AppColor.white,fontSize: 17,fontFamily: "Roboto"),),) :remoteVideoView(remoteUids[0]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight(context, dividedBy: 20),
                      left: screenWidth(context, dividedBy: 15),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_new,color: AppColor.white,)
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: screenHeight(context,dividedBy: 4),
                    width: screenWidth(context),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                              onTap: () => leave(),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 40)),
                                height: screenHeight(context,dividedBy: 13),
                                width: screenHeight(context,dividedBy: 13),
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle
                                ),
                                child:  Center(
                                  child: Image(
                                    image:  const AssetImage('assets/Images/Endcall.png'),
                                    height: screenHeight(context,dividedBy: 20),
                                    width: screenHeight(context,dividedBy: 20),
                                    color: AppColor.white,
                                  ),
                                ),
                              )

                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.only(
                                right: screenWidth(context,dividedBy: 20),
                                bottom: screenHeight(context,dividedBy: 80)
                            ),
                            height: screenHeight(context,dividedBy: 4.5),
                            width: screenWidth(context,dividedBy: 3),
                            decoration: BoxDecoration(
                                // color: Colors.greenAccent,
                              border: Border.all(color: Colors.red,width: 2),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child:  localVideoView(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      right: screenWidth(context,dividedBy: 7),
                      left: screenWidth(context,dividedBy: 7),
                      bottom: screenHeight(context,dividedBy: 15),
                      top: screenHeight(context,dividedBy: 25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/Images/cameraposition.png'),
                          height: screenHeight(context,dividedBy: 20),
                          width: screenHeight(context,dividedBy: 20),
                          color: AppColor.white,
                        ),
                        Image(
                          image: const AssetImage('assets/Images/chaticon.png'),
                          height: screenHeight(context,dividedBy: 20),
                          width: screenHeight(context,dividedBy: 20),
                          color: AppColor.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              mic = !mic;
                            });
                          },
                          child: Image(
                            image: mic ? const AssetImage('assets/Images/mic.png') :const AssetImage('assets/Images/micoff.png'),
                            height: screenHeight(context,dividedBy: 20),
                            width: screenHeight(context,dividedBy: 20),
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
