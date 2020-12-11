import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'facebook_code.dart';
import 'dart:io' show Platform;
import 'constants.dart';

// ignore: must_be_immutable
class Destination extends StatefulWidget {
  final String entry;
  final String definition;

  Destination({this.entry, this.definition});

  @override
  DestinationState createState() => DestinationState();
}

class DestinationState extends State<Destination> {
  //String FB_INTERSTITIAL_AD_ID =
  //    "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";
  bool isInterstitialAdLoaded = false;

  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );
    loadInterstitialAd(); //This was called in main
    loadBannerAd();
    //_showInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.entry,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        //mainAxisSize: MainAxisSize.min,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30.0, bottom: 30.0),
              child: Text(
                widget.definition,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  //_loadInterstitialAd();
                  // _showInterstitialAd();
                  //print('Vuelta a main');
                },
                color: Colors.blue[900],
                child: Text(
                  "Back to Contents",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            //bannerAd
          ],
        ),
      ),
      bottomNavigationBar: bannerAd,
    );
  }
}
