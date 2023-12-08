import 'package:flutter/material.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/header_space.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/App_Colors.dart';
import 'package:pair_me/helper/Size_page.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cardholderName = TextEditingController();
  final TextEditingController _mmyy = TextEditingController();
  final TextEditingController _cvc = TextEditingController();
  final TextEditingController _Zipcode = TextEditingController();
  final TextEditingController _email = TextEditingController();
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
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                titleSpacing: 0,
                title: custom_header(text: "Card Details"),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_textfield_header(text: 'Card Number'),
                      Custom_textfield(context, number: true,show_icon: false, onPress: () {},  hint: 'Card Number', controller: _cardNumber, hidetext: false, readOnly: false),
                      custom_textfield_header(text: 'Cardholder Name'),
                      Custom_textfield(context,show_icon: false, onPress: () {},  hint: 'Cardholder Name', controller: _cardholderName, hidetext: false, readOnly: false),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'MM/YY'),
                                Custom_textfield(context, number: true,show_icon: false, onPress: () {},  hint: 'MM/YY', controller: _mmyy, hidetext: false, readOnly: false),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth(context,dividedBy: 40),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'CVC'),
                                Custom_textfield(context, number: true,show_icon: false, onPress: () {},  hint: 'CVC', controller: _cvc, hidetext: false, readOnly: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                      custom_textfield_header(text: 'Post code / Zip code'),
                      Custom_textfield(context,show_icon: false, onPress: () {},  hint: 'Post code / Zip code', controller: _Zipcode, hidetext: false, readOnly: false),
                      custom_textfield_header(text: 'E-mail'),
                      Custom_textfield(context,show_icon: false, onPress: () {},  hint: 'Enter your email', controller: _email, hidetext: false, readOnly: false),
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
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      image: const DecorationImage(image: AssetImage('assets/Images/check.png'),fit: BoxFit.fill)
                                  ),
                                ) : const SizedBox(),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth(context,dividedBy: 50),),
                          Text('Save Card details for future Payments',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,fontFamily: 'Roboto',color: select ? Color(0xff303030) : Color(0xffB3B3B3)),)
                        ],
                      ),
                      SizedBox(height: screenHeight(context,dividedBy: 70),),
                      const Text('You’ll be able to delete your card details at any time from your settings.',style: TextStyle(fontSize: 10,color:Color(0xff8A8A8A) ,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),),
                      Container(
                        margin: EdgeInsets.only(
                          top: screenHeight(context,dividedBy: 40),
                          bottom: screenHeight(context,dividedBy: 70),
                        ),
                        height: screenHeight(context,dividedBy: 7.7),
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
                          padding:  EdgeInsets.symmetric(vertical: screenHeight(context,dividedBy: 100)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 35)),
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('PaiMe Gold” 12 months:',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                      Text('\$250',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context,dividedBy: 100),
                              ),
                              const Divider(
                                height: 0,
                                color: Color(0xffF5F5F5),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 35),vertical: screenHeight(context,dividedBy: 150)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tax:',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                    Text('---------',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 0,
                                color: Color(0xffF5F5F5),
                              ),
                              SizedBox(
                                height: screenHeight(context,dividedBy: 100),
                              ),
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 35)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total:',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                    Text('---------',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,fontFamily: 'Roboto'),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(text: 'By tapping Buy Now, we will charge your card, your subscription will automatically renew for the same package length at the same price until you cancel in Account Settings, and you agree to our ',style:
                              TextStyle(fontSize: 10,color:Color(0xff8A8A8A) ,fontWeight: FontWeight.w400,fontFamily: 'Roboto')
                              ),
                              TextSpan(text:'Terms.',style: TextStyle(decoration: TextDecoration.underline,fontSize: 10,color:AppColor.black ,fontWeight: FontWeight.w400,fontFamily: 'Roboto'),
                              ),
                            ],

                          )),
                      Custom_botton(context, text: 'Buy Now', onTap: () {

                      }, height: screenHeight(context,dividedBy: 20))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
