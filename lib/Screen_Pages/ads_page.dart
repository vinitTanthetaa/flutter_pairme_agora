import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pair_me/Modal/ads_display.dart';
import 'package:pair_me/Widgets/Background_img.dart';
import 'package:pair_me/Widgets/custom_texts.dart';
import 'package:pair_me/helper/Size_page.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({super.key});

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  BannerAd? bannerAd;
  bool _isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
             // Background_Img(context),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                              image: const AssetImage('assets/Images/back.png'),
                              height: screenHeight(context, dividedBy: 50),
                              width: screenHeight(context, dividedBy: 50),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth(context, dividedBy: 25),
                          ),
                          custom_header(text: "Ads"),
                          // Text('Back')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 55),
                    ),
                    custom_discription(
                        text:
                            "Your new password cannot be the same as a previous password"),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    bannerAd == null
                        ? SizedBox()
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: SafeArea(
                              child: SizedBox(
                                width: bannerAd!.size.width.toDouble(),
                                height: bannerAd!.size.height.toDouble(),
                                child: AdWidget(ad: bannerAd!),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    Container(
                     // height: screenHeight(context, dividedBy: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
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
                        padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 50),vertical: screenHeight(context,dividedBy: 50)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: screenHeight(context, dividedBy: 10),
                                  width: screenHeight(context, dividedBy: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                                 SizedBox(width: screenWidth(context,dividedBy: 50),),
                                 Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ve",
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "₹169",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                          SizedBox(width: screenWidth(context, dividedBy: 70),),
                                          Text(
                                            "₹170",
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 13,
                                              color: Colors.grey,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth(context, dividedBy: 70),),
                                          Text(
                                            "10% off",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "All issue is return",
                                        maxLines: 1,
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 15),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Size: ",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "17",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                          SizedBox(width: screenWidth(context, dividedBy: 70),),
                                          Text(
                                            "•",
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth(context, dividedBy: 70),),
                                          Text(
                                            "Qty: ",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "1",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.clear),
                                          Text(
                                            " Remove",
                                            maxLines: 1,
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 15),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 50)),
                              child: const Divider(),
                            ),
                            const Row(
                              children: [
                                Text(
                                  "Sold by: ",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                                Text(
                                  "FOREVER BLINGS",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Text(
                                  "Free Delivery",
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    Container(
                      height: screenHeight(context,dividedBy: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(
                                1,
                                1,
                              ),
                              blurRadius: 4,
                              spreadRadius: 0.0,
                            ),
                          ]
                      ),
                      child: Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 15)),child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Wishlist"),
                          Icon(Icons.arrow_forward)
                        ],
                      ),),
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    InkWell(
                      onTap: () {
                        DisplayBannerAd();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight(context, dividedBy: 20),
                        width: screenWidth(context),
                        color: Colors.red,
                        child: const Text("Banner Ads"),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    InkWell(
                        onTap: () {
                          AdDisplay().LoadInterstitial();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight(context, dividedBy: 20),
                          width: screenWidth(context),
                          color: Colors.red,
                          child: const Text("Interstitial Ads"),
                        )),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    InkWell(
                        onTap: () {
                          AdDisplay().LoadRewardedInterstitialAds();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight(context, dividedBy: 20),
                          width: screenWidth(context),
                          color: Colors.red,
                          child: const Text("Rewarded Interstitial Ads"),
                        )),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    InkWell(
                        onTap: () {
                          AdDisplay().LoadRewarded();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight(context, dividedBy: 20),
                          width: screenWidth(context),
                          color: Colors.red,
                          child: const Text("Rewarded Ads"),
                        )),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    InkWell(
                        onTap: () {
                          AdDisplay().LoadAppOpenAds();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: screenHeight(context, dividedBy: 20),
                          width: screenWidth(context),
                          color: Colors.red,
                          child: const Text("App Open Ads"),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';
  final adUnitIdLive = Platform.isAndroid
      ? 'ca-app-pub-4816405694010595/9963563115'
      : 'ca-app-pub-3940256099942544/2934735716';

  DisplayBannerAd() {
    bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          print('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
          // setState(() {
          //   _isLoaded = true;
          // });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          print('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
    setState(() {});
  }
}
