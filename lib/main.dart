import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' show Platform;
import 'facebook_code.dart';
import 'listentries.dart';
import 'custom_dialog.dart';
import 'navigate.dart';
import 'constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:io';

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
  int selectedIndex = 0;
  final widgetElements = new ListEntries(); // from listentries.dart
  bool isInterstitialAdLoaded = false;

  @override
  Future<void> initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );

    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.init("934893a3-d7e2-4130-a314-fe29eb59f5f4", iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false
    });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);

    loadInterstitialAd();
    loadBannerAd();
    showInterstitialAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Dictionary of Insurance Terms",
          style: TextStyle(fontSize: 20),
        ),
      ),
      // Hamburguer menu AKA drawer in flutter
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Other Apps",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                launchURL(Platform.isAndroid
                    ? Constants.URLOtherAppsAndroid
                    : Constants.URLOtherAppsIOS);
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                        title: "Dictionary of Insurance",
                        descriptions:
                            "Dictionary of Insurance Terms by Aplanetbit. \n \nSource: © 2021 National Association of Insurance Commissioners (NAIC). Reprinted with permission. Further reprint or distribution strictly prohibited without written permission of NAIC.\n \nIcons made by flaticon.com ",
                        text: "Close",
                      );
                    });
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Rate Us",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                launchURL(Platform.isAndroid
                    ? Constants.URLRateUsAndroid
                    : Constants.URLRateUSIOS);
              },
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "AplanetBit Web",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                launchURL(Constants.URLAplanetBit);
              },
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
      body: Center(
        //
        // Here comes the definition of all the buttons from listentries.dart
        //
        child: widgetElements,
      ),
      bottomNavigationBar: bannerAd,
    );
  }
}
