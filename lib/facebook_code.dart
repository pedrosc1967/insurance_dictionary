import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'constants.dart';

/*
class Facebook extends StatefulWidget {
  Facebook._();
  @override
  FacebookState createState() => FacebookState();
}

class FacebookState extends State<Facebook> {
  String FB_INTERSTITIAL_AD_ID =
      "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";
  bool isInterstitialAdLoaded = false;



  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );

    _loadInterstitialAd();
    //loadBannerAd();
    //_showInterstitialAd();
    super.initState();
  }
 */

bool isInterstitialAdLoaded = false;

void loadInterstitialAd() {
  FacebookInterstitialAd.loadInterstitialAd(
    placementId: Platform.isAndroid
        ? Constants.interstitialAndroid
        : Constants.interstitialIOS,
    listener: (result, value) {
      if (result == InterstitialAdResult.LOADED) {
        isInterstitialAdLoaded = true;
        print('Result:' + result.toString());
      }
      if (result == InterstitialAdResult.DISMISSED &&
          value["invalidated"] == true) {
        isInterstitialAdLoaded = false;
        print('Result: ' + result.toString());
        loadInterstitialAd();
      }
    },
  );
}

void showInterstitialAd() {
  if (isInterstitialAdLoaded == true) {
    FacebookInterstitialAd.showInterstitialAd();
  } else {
    print("Ad not loaded yet, pito");
  }
}

Widget bannerAd = SizedBox(width: 0, height: 0);

void loadBannerAd() {
  bannerAd = FacebookBannerAd(
    placementId:
        Platform.isAndroid ? Constants.bannerAndroid : Constants.bannerIOS,
    bannerSize: BannerSize.STANDARD,
    listener: (result, value) {
      print("$result == $value");
    },
  );
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
