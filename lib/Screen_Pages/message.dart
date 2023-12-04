import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/chat.dart';
import 'package:pair_me/Screen_Pages/message_request.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Message_page extends StatefulWidget {
  const Message_page({super.key});

  @override
  State<Message_page> createState() => _Message_pageState();
}

class _Message_pageState extends State<Message_page> {
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
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder:(context) {
                             return MessageRequest();
                           },));
                         },
                           child: const Text('Requests (2)',style: TextStyle(fontSize: 15,fontFamily: 'Roboto',fontWeight: FontWeight.w500,color: AppColor.skyBlue),)),
                     ],
                   ),
                 ),
                 SizedBox(height: screenHeight(context,dividedBy: 100),),
                 Expanded(child:
                 ListView.separated(
                   shrinkWrap: true,
                   physics: const ClampingScrollPhysics(),
                     padding: EdgeInsets.only(bottom:screenHeight(context,dividedBy: 50) ),
                     itemBuilder: (context, index) {
                       return  GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) {
                             return Chatting_Page(name: 'chatting',);
                           },));
                         },
                         child: Dismissible(
                           direction: DismissDirection.endToStart,
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
                               decoration: const BoxDecoration(
                                   image: DecorationImage(image: AssetImage('assets/Images/delete.png'))
                               ),
                             ) ,
                           ),
                           child: SizedBox(
                             // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                             height: screenHeight(context,dividedBy: 10.4),
                             width: screenHeight(context),
                             child: Padding(
                               padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 20),vertical: screenHeight(context,dividedBy: 90)),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(
                                     height: screenHeight(context,dividedBy: 15),
                                     width: screenHeight(context,dividedBy: 15),
                                     decoration: const BoxDecoration(
                                         shape: BoxShape.circle,
                                         image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU'),fit: BoxFit.fill)
                                     ),
                                   ),
                                   SizedBox(width: screenWidth(context,dividedBy: 40),),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const Text('Jane Koblenz',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
                                       SizedBox(
                                         width: screenWidth(context,dividedBy: 2.2),
                                         child: const Text('Duis protium gravida denim, vei maximus ligula......',maxLines: 2,style: TextStyle(color: Color(0xffAAAAAA),fontSize: 10,fontWeight: FontWeight.w400,fontFamily: 'Roboto')),
                                       )
                                     ],
                                   ),
                                   const Spacer(),
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       const Text('2 min',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xffAAAAAA)),),
                                       Container(
                                         alignment: Alignment.center,
                                         height: screenHeight(context,dividedBy: 50),
                                         width: screenHeight(context,dividedBy: 50),
                                         decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                           gradient:LinearGradient(
                                             begin: Alignment.topLeft,
                                               end: Alignment.bottomCenter,
                                               colors: [AppColor.skyBlue,AppColor.whiteskyBlue]
                                           )
                                         ),
                                         child: Text('2',style: TextStyle(color: AppColor.white,fontWeight: FontWeight.w600,fontFamily: 'Roboto',fontSize: 7)),
                                       )
                                     ],
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       );
                     },
                     separatorBuilder: (context, index) {
                       return  const Divider(
                         height: 0,
                         thickness: 2,
                         //color: Color(0xffF5F5F5),
                         color: Colors.black26,
                       );
                     },
                     itemCount: 10)),
               ],
             )),

            // Center(
            //   child: Container(
            //     height: screenHeight(context,dividedBy: 5),
            //     width: screenHeight(context,dividedBy: 5),
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(image: AssetImage('assets/Images/nomsg.png'))
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
