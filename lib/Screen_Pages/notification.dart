import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({super.key});

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {

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
                  SizedBox(height: screenHeight(context,dividedBy: 150),),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        custom_header(text: 'Notification'),
                        const Text('Clear all',style: TextStyle(fontFamily: 'Roboto',fontSize: 14,fontWeight: FontWeight.w500,color: AppColor.skyBlue),)
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight(context,dividedBy: 70),),
                 Expanded(
                     child: ListView.separated(
                       padding: EdgeInsets.only(bottom:screenHeight(context,dividedBy: 50), ),
                     itemBuilder: (context, index) {
                       return  Dismissible(
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
                           // child: customText(
                           //     "Delete",
                           //     Colors.white,
                           //     18,
                           //     FontWeight.w700,
                           //     poppins),
                         ),
                         child: SizedBox(
                           // margin: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                           height: screenHeight(context,dividedBy: 10),
                           width: screenHeight(context),
                           child: Padding(
                             padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15),vertical: screenHeight(context,dividedBy: 90)),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   height: screenHeight(context,dividedBy: 15),
                                   width: screenHeight(context,dividedBy: 15),
                                   child:  Stack(
                                     alignment: Alignment.center,
                                     children: [
                                       Positioned(
                                         bottom: 0.0,
                                         child: Container(
                                           height: screenHeight(context,dividedBy: 15),
                                           width: screenHeight(context,dividedBy: 15),
                                           decoration: const BoxDecoration(
                                               shape: BoxShape.circle,
                                               image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCczoMDFIc77qVeqtnJ26h8Yen0WXNfyLTIg&usqp=CAU'))
                                           ),
                                         ),
                                       ),
                                       const Positioned(
                                         bottom: 2,
                                         left: 5,
                                         child: CircleAvatar(
                                           radius: 4,
                                           backgroundColor: Color(0xff0FC62C),
                                         ),
                                       )
                                     ],
                                   ),
                                 ),
                                 SizedBox(width: screenWidth(context,dividedBy: 50),),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     const Text('Jane Koblenz',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'Roboto'),),
                                     SizedBox(
                                       width: screenWidth(context,dividedBy: 1.9),
                                       child: const Text('Duis protium gravida denim, vei maximus ligula......',maxLines: 2,style: TextStyle(color: Color(0xffAAAAAA),fontSize: 10,fontWeight: FontWeight.w400,fontFamily: 'Roboto')),
                                     )
                                   ],
                                 ),
                                 const Spacer(),
                                 const Text('2 min',style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.w400,fontSize: 10,color: Color(0xffAAAAAA)),)
                               ],
                             ),
                           ),
                         ),
                       );
                     },
                     separatorBuilder: (context, index) {
                      return  const Divider(
                         height: 0,
                        thickness: 2,
                     //   color: Color(0xffF5F5F5),
                        color: Colors.black12,
                       );
                     },
                     itemCount: 10))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
