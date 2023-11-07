import 'package:flutter/material.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class VoiceCallPage extends StatefulWidget {
  const VoiceCallPage({super.key});

  @override
  State<VoiceCallPage> createState() => _VoiceCallPageState();
}

class _VoiceCallPageState extends State<VoiceCallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withGreen(100),
      body: SizedBox(
        height: screenHeight(context),
        width: screenHeight(context),
        child: Container(
          height: screenHeight(context),
          width: screenHeight(context),
          // decoration: BoxDecoration(
          // //  gradient: RadialGradient(colors: [Colors.white54,Colors.black54])
          // ),
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
                      child: Image(
                        image: const AssetImage('assets/Images/back.png'),
                        height: screenHeight(context,dividedBy: 35),
                        width: screenHeight(context,dividedBy: 35),
                        color: AppColor.white,
                      ),
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          image: DecorationImage(image:NetworkImage('https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),fit: BoxFit.fill)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight(context,dividedBy: 50),),
              Text('Nick Stewart',style: TextStyle(fontFamily: 'Roboto',color: AppColor.white,fontWeight: FontWeight.w600,fontSize: 25),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 7),vertical: screenHeight(context,dividedBy: 30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
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
                    Container(
                      height: screenHeight(context ,dividedBy: 13),
                      width: screenHeight(context ,dividedBy: 13),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color:Color(0xffC8C8C8),width: 2)
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
                    Container(
                      height: screenHeight(context ,dividedBy: 13),
                      width: screenHeight(context ,dividedBy: 13),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color:Color(0xffC8C8C8),width: 2)
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
                  ],
                ),
              ),
              SizedBox(height: screenHeight(context,dividedBy: 50),),
              GestureDetector(
                  child: Container(
                    height: screenHeight(context,dividedBy: 10),
                    width: screenHeight(context,dividedBy: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child:  Center(
                      child: Image(
                        image:  AssetImage('assets/Images/Endcall.png'),
                        height: screenHeight(context,dividedBy: 15),
                        width: screenHeight(context,dividedBy: 15),
                        color: AppColor.white,
                      ),
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}
