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
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:package_info/package_info.dart';
import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

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

    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      // will be called whenever a notification is received
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // will be called whenever a notification is opened/button pressed.
    });

    OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
      // will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.shared
        .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
      // will be called whenever the subscription changes
      //(ie. user gets registered with OneSignal and gets a user ID)
    });

    OneSignal.shared.setEmailSubscriptionObserver(
        (OSEmailSubscriptionStateChanges emailChanges) {
      // will be called whenever then user's email subscription changes
      // (ie. OneSignal.setEmail(email) is called and the user gets registered
    });

// For each of the above functions, you can also pass in a
// reference to a function as well:

    loadInterstitialAd();
    loadBannerAd();
    super.initState();
    _initPackageInfo();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // Release back device's orientations when the page is exited
  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
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
                            "Dictionary of Insurance Terms by Aplanetbit.\n " +
                                "Version:" +
                                _packageInfo.version +
                                "\n\nSource: © 2021 National Association of Insurance Commissioners (NAIC). Reprinted with permission. Further reprint or distribution strictly prohibited without written permission of NAIC.\n \nIcons made by flaticon.com ",
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
