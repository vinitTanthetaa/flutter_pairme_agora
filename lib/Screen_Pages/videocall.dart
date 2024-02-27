import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoCallPage extends StatefulWidget {
  const VideoCallPage({super.key});

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
  RtcEngine? agoraEngine; // Agora engine instance
  bool  mic = false;
  Future<void> setupAgoraEngine() async {
    // Retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();

    // Create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine!.initialize(RtcEngineContext(appId: appId));
    await agoraEngine!.enableVideo();
    // Register the event handler
    agoraEngine!.registerEventHandler(getEventHandler());
  }
  RtcEngineEventHandler getEventHandler() {
    return RtcEngineEventHandler(
      // Occurs when the network connection state changes
      onConnectionStateChanged: (RtcConnection connection,
          ConnectionStateType state, ConnectionChangedReasonType reason) {
        if (reason ==
            ConnectionChangedReasonType.connectionChangedLeaveChannel) {
          remoteUids.clear();
          isJoined = false;
        }
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["state"] = state;
        eventArgs["reason"] = reason;
       // eventCallback("onConnectionStateChanged", eventArgs);
      },
      // Occurs when a local user joins a channel
      onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
        isJoined = true;
      //  messageCallback(
        //    "Local user uid:${connection.localUid} joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["elapsed"] = elapsed;
       // eventCallback("onJoinChannelSuccess", eventArgs);
      },
      // Occurs when a remote user joins the channel
      onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
        remoteUids.add(remoteUid);
       // messageCallback("Remote user uid:$remoteUid joined the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["remoteUid"] = remoteUid;
        eventArgs["elapsed"] = elapsed;
      //  eventCallback("onUserJoined", eventArgs);
      },
      // Occurs when a remote user leaves the channel
      onUserOffline: (RtcConnection connection, int remoteUid,
          UserOfflineReasonType reason) {
        remoteUids.remove(remoteUid);
       // messageCallback("Remote user uid:$remoteUid left the channel");
        // Notify the UI
        Map<String, dynamic> eventArgs = {};
        eventArgs["connection"] = connection;
        eventArgs["remoteUid"] = remoteUid;
        eventArgs["reason"] = reason;
       // eventCallback("onUserOffline", eventArgs);
      },
    );
  }
  AgoraVideoView remoteVideoView(int remoteUid) {
    return AgoraVideoView(
      controller: VideoViewController.remote(
        rtcEngine: agoraEngine!,
        canvas: VideoCanvas(uid: remoteUid),
        connection: RtcConnection(channelId: channelName),
      ),
    );
  }
  AgoraVideoView localVideoView() {
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: agoraEngine!,
        canvas: const VideoCanvas(uid: 0), // Use uid = 0 for local view
      ),
    );
  }
  Future<void> leave() async {
    // Clear saved remote Uids
    remoteUids.clear();

    // Leave the channel
    if (agoraEngine != null) {
      await agoraEngine!.leaveChannel();
    }
    isJoined = false;

    // Destroy the Agora engine instance
    destroyAgoraEngine();
  }
  void destroyAgoraEngine() {
    // Release the RtcEngine instance to free up resources
    if (agoraEngine != null) {
      agoraEngine!.release();
      agoraEngine = null;
    }
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
          child:     Column(
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
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
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
          ),
        ),

      ),
    );
  }
}
