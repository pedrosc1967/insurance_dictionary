import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'destination.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String FB_INTERSTITIAL_AD_ID =
      "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617";
  bool isInterstitialAdLoaded = false;

  @override
  void initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );

    _loadInterstitialAd();
    loadBannerAd();
    _showInterstitialAd();

    super.initState();
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: FB_INTERSTITIAL_AD_ID,
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          isInterstitialAdLoaded = true;
        }
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  _showInterstitialAd() {
    if (isInterstitialAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      print("Ad not loaded yet, pito");
    }
  }

  Widget _bannerAd = SizedBox(width: 0, height: 0);

  void loadBannerAd() {
    setState(() {
      _bannerAd = FacebookBannerAd(
        placementId: Platform.isAndroid
            //? "1330190004069862_1330190360736493"
            ? "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047"
            : "1330190004069862_1330224187399777",
        //placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047",
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("$result == $value");
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary of Insurance"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accident",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accident Insurance",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accident Only",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accident Only or AD&D",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SixthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accidental Bodily Injury",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeventhRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accidental Death & Dismemberment",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EighthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Accumulation Period",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NinethRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Actual Cash Value",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NinethAndAHalfRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Actuarial Report",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Actuary",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EleventhRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Adjuster",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwelfthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Admission",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Admitted Assets",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FourteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Admitted Company",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FifteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Advance Premiums",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SixteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Adverse Selection",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeventeenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Advisory Organization",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EithteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Affiliate",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NineteenthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Agent",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwentythRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Aggregate",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TwentyFirsthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Aggregate Cost Payments",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TwentySecondthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Aircraft",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TwentyThirthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "ALAE",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TwentyFourthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Alien Company ",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwentyFifthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "Allied Lines",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwentySixthRoute()),
                  );
                },
                color: Colors.blue[300],
                child: Text(
                  "All-Risk",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            FlatButton(
              child: Text("Load Banner Ad"),
              onPressed: () => loadBannerAd(),
            ),
            FlatButton(
                child: Text("Load Interstitial Ad"),
                onPressed: () => _showInterstitialAd()),
            Flexible(
              child: Container(),
              flex: 1,
              fit: FlexFit.loose,
            ),
            _bannerAd
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
      ),
    );
  }
}
