import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/custom_loader.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';
import 'package:video_player/video_player.dart';

class Image_Screen extends StatefulWidget {
  String image;
   Image_Screen({super.key,required this.image});

  @override
  State<Image_Screen> createState() => _Image_ScreenState();
}

class _Image_ScreenState extends State<Image_Screen> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.image))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.image.endsWith('.mp4') || widget.image.endsWith('.3gpp')?
      _controller!.value.isInitialized ? SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Stack(
              children: [
                VideoPlayer(_controller!),
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_ios_new,color: AppColor.white,)),
                Align(
                  alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white30,
                      child: GestureDetector(onTap: () {
                        setState(() {
                          _controller!.value.isPlaying
                              ? _controller?.pause()
                              : _controller?.play();
                        });
                      },child: Icon(_controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,size: 30,)),
                    ))
              ],
            ),
          ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,color: AppColor.white,)),
          Expanded(child: Center(child: customLoader()))
        ],
      ) :
      InteractiveViewer(
        child: CachedNetworkImage(
          imageUrl: widget.image,
          imageBuilder: (context, imageProvider) {
            return  Container(
              height: screenHeight(context),
              width: screenWidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover,filterQuality: FilterQuality.high)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios_new,color: AppColor.white,))
                ],
              ),
            );
          },
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),

    );
  }
}
