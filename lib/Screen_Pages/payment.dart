import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/payment_method.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight(context,dividedBy: 150),),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: const AssetImage('assets/Images/back.png'),
                            height: screenHeight(context,dividedBy: 40),
                            width: screenHeight(context,dividedBy: 40),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth(context, dividedBy: 25),
                        ),
                        custom_header(text: 'Payment')
                        // IconButton(onPressed: () {
                        //
                        // }, icon: Icon(Icons.close))
                      ],
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 50),),
                    paymentCard(context, name: 'Paypal', img: 'assets/Images/paypal.png', onTap: () {  }),
                    space(context),
                    paymentCard(context, name: 'Google Pay', img: 'assets/Images/google.png', onTap: () {  }),
                    space(context),
                    paymentCard(context, name: 'Apple Pay', img: 'assets/Images/apple.png', onTap: () {  }),
                    space(context),
                    paymentCard(context, name: 'Credit or Debit Card', img: 'assets/Images/card.png', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return PaymentMethod();
                      },));
                    }),
                    SizedBox(height: screenHeight(context,dividedBy: 60),),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              select = !select;
                            });
                          },
                          child: Container(
                            height: screenHeight(context,dividedBy: 45),
                            width: screenHeight(context,dividedBy: 45),
                            color: const Color(0xffD4E2FF),
                            child: Center(
                              child: select ? Container(
                                height: screenHeight(context,dividedBy: 65),
                                width: screenHeight(context,dividedBy: 65),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                                ),
                              ) : const SizedBox(),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth(context,dividedBy: 50),),
                        Text('Save Card details for future Payments',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Roboto',color: select ? Color(0xff303030) : Color(0xffB3B3B3)),)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget paymentCard (BuildContext context,{required Function() onTap,required String name,required String img}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: screenHeight(context,dividedBy: 17),
      width: screenWidth(context),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: AppColor.gray,
              offset: Offset(
                1,
                1,
              ),
              blurRadius: 4,
              spreadRadius: 0.0,
            ),
          ]

      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy:35)),
        child: Row(
          children: [
            Image(
              image:  AssetImage(img),
              height: screenHeight(context,dividedBy: 35),
              width: screenHeight(context,dividedBy: 37),
            ),
            SizedBox(width: screenWidth(context,dividedBy: 40),),
            Text(name,style: TextStyle(color: AppColor.black,fontFamily: 'Roboto',fontWeight: FontWeight.w500,fontSize: 12),)
          ],
        ),
      ),
    ),
  );
}
Widget space (BuildContext context){
  return SizedBox(height: screenHeight(context,dividedBy: 70),);
}
