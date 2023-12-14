import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/professional_details.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/Widgets/textfield.dart';
import 'package:pair_me/helper/Size_page.dart';

class Address_Details extends StatefulWidget {

  Address_Details({super.key});

  @override
  State<Address_Details> createState() => _Address_DetailsState();
}

class _Address_DetailsState extends State<Address_Details> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  bool _contry = false;
  bool _state = false;
  bool _city = false;
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _Address2 = TextEditingController();
  final TextEditingController _Zipcode = TextEditingController();
  final TextEditingController _Contry = TextEditingController();
  final TextEditingController _State = TextEditingController();
  final TextEditingController _City = TextEditingController();
  final dio = Dio();

  void getHttp() async {
    // citys
    final response = await dio.get('https://countriesnow.space/api/v0.1/countries',);
    // State
    final response1 = await dio.get('https://countriesnow.space/api/v0.1/countries/states',);
    final response2 = await dio.get('http://universities.hipolabs.com/search?country=United+States',);
    // final response2 = await dio.post('https://countriesnow.space/api/v0.1/countries/cities',data: {
    //   "country": "Nigeria",
    //   "state": "Lagos"
    // });
    print(response);
    print(response1);
    print(response2);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getHttp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth(context,dividedBy: 20)),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    )),
                title: custom_header(text: "Address Details"),
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_discription(text: "Please show some alternative font designs throughout the app"),
                      SizedBox(height: screenHeight(context,dividedBy: 50),),
                      custom_textfield_header(text: 'Address'),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 1",mxline: 2, hidetext: false, controller: _Address),
                      Custom_textfield(context, show_icon: false, readOnly: false, onPress: () {

                      }, hint: "Address line 2",mxline: 2, hidetext: false, controller: _Address2),
                      custom_textfield_header(text: 'Country'),
                      Custom_textfield(context, onTap: () {
                        setState(() {
                          _contry = !_contry;
                        });
                      },show_icon: true,image: _contry ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                        setState(() {
                          _contry = !_contry;
                        });
                      }, hint: "Select", hidetext: false, controller: _Contry),
                      _contry ?Container(
                        height: screenHeight(context,dividedBy: 7),
                        width: screenWidth(context),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                                blurRadius: 4,
                                // spreadRadius: 1.0,
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              custom_text(text: 'Armenia', color: const Color(0xff303030)),
                              custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                              custom_text(text: 'Denmark', color: const Color(0xff303030)),
                              custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                            ],
                          ),
                        ),
                      ) : const SizedBox(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'State'),
                                Custom_textfield(context, onTap: () {
                                  setState(() {
                                    _state = !_state;
                                  });
                                },show_icon: true,image: _state ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                  setState(() {
                                    _state = !_state;
                                  });
                                }, hint: "Select", hidetext: false, controller: _State),
                                _state ? Container(
                                  height: screenHeight(context,dividedBy: 7),
                                  width: screenWidth(context),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            1,
                                            1,
                                          ),
                                          blurRadius: 4,
                                          // spreadRadius: 1.0,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                        custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                        custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                        custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                      ],
                                    ),
                                  ),
                                ) : SizedBox(height: _city ?screenHeight(context,dividedBy: 6.35) : 0,)
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth(context,dividedBy: 50),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                custom_textfield_header(text: 'City'),
                                Custom_textfield(onTap: () {
                                  setState(() {
                                    _city = !_city;
                                  });
                                },context, show_icon: true,image: _city ?'assets/Images/Vector.png' : 'assets/Images/right_arrow.png', readOnly: true, onPress: () {
                                  setState(() {
                                    _city = !_city;
                                  });
                                }, hint: "Select", hidetext: false, controller: _City),
                                _city? Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: screenHeight(context,dividedBy: 7),
                                  width: screenWidth(context),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(
                                            1,
                                            1,
                                          ),
                                          blurRadius: 4,
                                          // spreadRadius: 1.0,
                                        ),
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        custom_text(text: 'Armenia', color: const Color(0xff303030)),
                                        custom_text(text: 'Bangladesh', color: const Color(0xff303030)),
                                        custom_text(text: 'Denmark', color: const Color(0xff303030)),
                                        custom_text(text: 'Ecuador', color: const Color(0xff303030)),
                                      ],
                                    ),
                                  ),
                                ):SizedBox(height:_state ? screenHeight(context,dividedBy: 6.35) : 0,)
                              ],
                            ),
                          )
                        ],),
                      custom_textfield_header(text: 'Post code / Zip code'),
                      Custom_textfield(context, show_icon: false,number: true, readOnly: false, onPress: () {

                      }, hint: "Post code / Zip code", hidetext: false, controller: _Zipcode),
                      Custom_botton(context, text:'SAVE', onTap: () {
                        Navigator.pop(context);
                      }, height: screenHeight(context,dividedBy: 20),)
                    ],
                  ),
                ),
              ),
            )
            // Positioned(
            //     top: 0.0,
            //     child: custom_stepper(context, positaion: 1)),
          ],
        ),
      )
      ),
    );
  }
}
