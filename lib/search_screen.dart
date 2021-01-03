import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'facebook_code.dart';

// ignore: must_be_immutable
class searchScreen extends StatefulWidget {
  final String searchTerm;

  searchScreen({this.searchTerm});

  @override
  SearchInput createState() => SearchInput();
}

class SearchInput extends State<searchScreen> {
  bool isInterstitialAdLoaded = false;

  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );
    loadInterstitialAd(); //This was called in main
    loadBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.searchTerm,
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
                widget.searchTerm,
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
