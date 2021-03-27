import 'package:mopub_flutter/mopub.dart';
import 'package:mopub_flutter/mopub_banner.dart';
import 'package:mopub_flutter/mopub_constants.dart';
import 'package:mopub_flutter/mopub_interstitial.dart';
import 'package:mopub_flutter/mopub_rewarded.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'constants.dart';

bool isInterstitialAdLoaded = false;

MoPubInterstitialAd interstitialAd;

void loadInterstitialAd() {
  interstitialAd = MoPubInterstitialAd(
    Constants.interstitialAndroid,
    (result, args) {
      print('Interstitial $result');
    },
    reloadOnClosed: true,
  );
}

//Widget bannerAd = SizedBox(width: 0, height: 0);

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
