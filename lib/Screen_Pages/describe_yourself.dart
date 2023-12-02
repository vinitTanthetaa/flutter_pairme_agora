import 'package:flutter/material.dart';
import 'package:pair_me/Screen_Pages/looking_for_connect.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_button.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/Widgets/select.dart';
import 'package:pair_me/Widgets/stepper.dart';
import 'package:pair_me/helper/Size_page.dart';

class Describe_Yourself extends StatefulWidget {
  const Describe_Yourself({super.key});

  @override
  State<Describe_Yourself> createState() => _Describe_YourselfState();
}

class _Describe_YourselfState extends State<Describe_Yourself> {
  final List _type = [];
  List lookingFor = [
    'Investor',
    'Startup Founder',
    'Corporate Executive',
    'Manufacturer',
    'Distributor',
    'Channel Partner',
    'Business Partner',
    'Translator',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Stack(
          children: [
            Background_Img(context),
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 10),
                    ),

                    //custom_stepper(context, positaion: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: custom_header(
                                text:
                                    "How would you best describe yourself? Select up to 3 of the following:")),
                        skip_button(
                          context,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const Looking_for();
                              },
                            ));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 1.75),
                      width: screenWidth(context),
                      child: ListView.builder(
                        itemCount: lookingFor.length,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return custom_selection(context,
                              top: screenHeight(context, dividedBy: 50),
                              text: lookingFor[index],
                              list: _type, onTap: () {
                            if (_type.length < 3) {
                              setState(() {
                                _type.contains(lookingFor[index])
                                    ? _type.remove(lookingFor[index])
                                    : _type.add(lookingFor[index]);
                              });
                            } else {
                              setState(() {
                                _type.remove(lookingFor[index]);
                              });
                            }
                          });
                        },
                      ),
                    ),
                    Custom_botton(context, text: 'Done', onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Looking_for();
                        },
                      ));
                    }, height: screenHeight(context, dividedBy: 25))
                  ],
                ),
              ),
            ),
            Positioned(top: 0.0, child: custom_stepper(context, positaion: 5)),
          ],
        ),
      ),
    );
  }
}
