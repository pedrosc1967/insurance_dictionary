import 'package:mopub_flutter/mopub.dart';
import 'package:mopub_flutter/mopub_banner.dart';
import 'package:mopub_flutter/mopub_constants.dart';
import 'package:mopub_flutter/mopub_interstitial.dart';
import 'package:mopub_flutter/mopub_rewarded.dart';
import 'dart:io' show Platform;
import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:insurance_dictionary/tts_helper.dart';
import 'package:share/share.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable...
class Destination extends StatefulWidget {
  final String entry;
  final String definition;

  Destination({this.entry, this.definition});

  @override
  DestinationState createState() => DestinationState();
}

class DestinationState extends State<Destination> {
  bool isInterstitialAdLoaded = false;
  String interstitialID;
  String bannerID;

  @override
  void initState() {
    if (Platform.isAndroid) {
      interstitialID = Constants.interstitialAndroid;
      bannerID = Constants.bannerAndroid;
    } else {
      interstitialID = Constants.interstitialiOS;
      bannerID = Constants.banneriOS;
    }
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(widget.entry + '\n \n' + widget.definition);
            },
          )
        ],
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
              margin: EdgeInsets.symmetric(vertical: 2.0),
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  speak(widget.entry + '\n ' + widget.definition);
                },
                color: Colors.green[900],
                child: Text(
                  'say_button'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  stop();
                },
                color: Colors.red[900],
                child: Text(
                  'stop_button'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2.0),
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.blue[900],
                child: Text(
                  'back_button'.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MoPubBannerAd(
        adUnitId: bannerID,
        bannerSize: BannerSize.STANDARD,
        keepAlive: true,
        listener: (result, dynamic) {
          print('$result');
        },
      ),
    );
  }
}
