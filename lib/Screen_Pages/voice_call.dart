import 'dart:convert';
import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceCallPage extends StatefulWidget {
  String img,name,uid,id;

  VoiceCallPage({super.key,required this.img,required this.name,required this.uid,required this.id});

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  int uid = 0; // uid of the local user
  String token = "";
  int? _remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine agoraEngine; // Agora engine instance
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey
  = GlobalKey<ScaffoldMessengerState>();
  final dio = Dio();
  createchannel() async {
    print(widget.uid);
    Map<String, dynamic> body = {
      "channel": widget.uid,
    };
    try {
      final response = await dio.post('http://192.168.29.113:3000/rtc',data: jsonEncode(body));
      token = response.data['rtcToken'];
      print("token =====> $token");
    } on Exception catch (e) {
      print("you are fully fail my friend " + e.toString());
      // TODO
    }
  }
  Future<void> setupVoiceSDKEngine() async {
    // retrieve or request microphone permission
    await [Permission.microphone].request();

    agoraEngine = createAgoraRtcEngine();
    await agoraEngine.initialize( RtcEngineContext(
        appId: AgoraAppid
    ));

    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onError: (err, msg) {
          print("error ==> ${err.name} and message ==> ${msg.toString()}");
        },
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print("connection ====> $connection");
        //  showMessage("Local user uid:${connection.localUid} joined the channel");
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
         // showMessage("Remote user uid:$remoteUid joined the channel");
          setState(() {
            _remoteUid = remoteUid;
            _isJoined = true;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
         // showMessage("Remote user uid:$remoteUid left the channel");
          setState(() {
            _remoteUid = null;
            leave();
          });
        },
      ),
    );
    join();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createchannel();
    setupVoiceSDKEngine();
  }
  // Clean up the resources when you leave
  @override
  void dispose() async {
    super.dispose();
    await agoraEngine.release();
    await agoraEngine.leaveChannel();
  }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.white12,
      body:_isJoined ? SizedBox(
        height: screenHeight(context),
        width: screenHeight(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            SizedBox(height: screenHeight(context,dividedBy: 50),),
            const Text('Incoming call',style: TextStyle(color: AppColor.white,fontSize: 15,fontWeight:  FontWeight.w400,fontFamily: 'Roboto'),),
            SizedBox(height: screenHeight(context,dividedBy: 100),),
            const Text('00:32',style: TextStyle(color:Color(0xff808080) ,fontSize: 12,fontWeight:  FontWeight.w400,fontFamily: 'Roboto'),),
            SizedBox(height: screenHeight(context,dividedBy: 40),),
            CircleAvatar(
              radius: screenWidth(context,dividedBy: 2.5),
              backgroundColor: Colors.black12,
              child: Center(
                child: CircleAvatar(
                  radius: screenWidth(context,dividedBy: 2.9),
                  backgroundColor: Colors.black26,
                  child: Center(
                    child: Container(
                      height: screenWidth(context,dividedBy: 1.75),
                      width: screenWidth(context,dividedBy: 1.75),
                      decoration:  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(image:NetworkImage(widget.img),fit: BoxFit.fitHeight)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight(context,dividedBy: 50),),
            Text(widget.name,style: const TextStyle(fontFamily: 'Roboto',color: AppColor.white,fontWeight: FontWeight.w600,fontSize: 25),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 7),vertical: screenHeight(context,dividedBy: 30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      agoraEngine.muteLocalAudioStream(true);
                    },
                    child: Container(
                      height: screenHeight(context ,dividedBy: 13),
                      width: screenHeight(context ,dividedBy: 13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color:Color(0xffC8C8C8),width: 2)
                      ),
                      child: Center(
                        child:Image(
                          image: const AssetImage('assets/Images/micoff.png'),
                          height: screenHeight(context,dividedBy: 25),
                          width: screenHeight(context,dividedBy: 25),
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight(context ,dividedBy: 13),
                    width: screenHeight(context ,dividedBy: 13),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color:const Color(0xffC8C8C8),width: 2)
                    ),
                    child: Center(
                      child:Image(
                        image: const AssetImage('assets/Images/chaticon.png'),
                        height: screenHeight(context,dividedBy: 25),
                        width: screenHeight(context,dividedBy: 25),
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // agoraEngine.sp
                    },
                    child: Container(
                      height: screenHeight(context ,dividedBy: 13),
                      width: screenHeight(context ,dividedBy: 13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color:const Color(0xffC8C8C8),width: 2)
                      ),
                      child: Center(
                        child:Image(
                          image: const AssetImage('assets/Images/Speaker.png'),
                          height: screenHeight(context,dividedBy: 25),
                          width: screenHeight(context,dividedBy: 25),
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight(context,dividedBy: 50),),
            GestureDetector(
                onTap: () => leave(),
                child: Container(
                  height: screenHeight(context,dividedBy: 10),
                  width: screenHeight(context,dividedBy: 10),
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle
                  ),
                  child:  Center(
                    child: Image(
                      image:  const AssetImage('assets/Images/Endcall.png'),
                      height: screenHeight(context,dividedBy: 15),
                      width: screenHeight(context,dividedBy: 15),
                      color: AppColor.white,
                    ),
                  ),
                )

            ),
          ],
        ),
      ): const Center(child: Text("Waiting..",style: TextStyle(fontSize: 25,fontFamily: "Roboto",color: AppColor.white)),)
    ) ;
  }
  Widget _status(){
    String statusText;

    if (!_isJoined)
      statusText = 'Join a channel';
    else if (_remoteUid == null)
      statusText = 'Waiting for a remote user to join...';
    else
      statusText = 'Connected to remote user, uid:$_remoteUid';

    return Text(
      statusText,
    );
  }
  void  join() async {
    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );
    print("token ===> $token}");
    print("chanel ===> ${widget.uid}");
    print(token );
    await agoraEngine.joinChannel(
      channelId: widget.uid,
      options: options,
      uid: uid,
      token: '007eJxTYHi7XuXIz10Rj9PNDnm1fsrYEuCg/cH4pVNs9JVMgYjdmWkKDOaGiclJJomJRpbJxibGSZaWhiamKYYmqclJqUbGyYZpCaYvUhsCGRkunHFnZGSAQBBfgsHMNDnVwNjCwCTVzMAg0cLEwjDZ0tQ8NZWBAQCR2SWr',
    );
  }
  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    Navigator.pop(context);
    agoraEngine.leaveChannel();
  }
}
