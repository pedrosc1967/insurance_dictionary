import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insurance_dictionary/alphabetical_screen.dart';
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
import 'package:rate_my_app/rate_my_app.dart';
import 'package:sentry/sentry.dart';
import 'search_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await [
    Firebase.initializeApp(),
    SentryFlutter.init(
      (options) {
        options.dsn =
            'https://7470e4eeb50e49fdba47b5e48d4e09f6@o496488.ingest.sentry.io/5571285';
      },
      //appRunner: () => runApp(MyApp()),
    )
  ];
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

  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    appStoreIdentifier: '1545741185',
    minDays: 0, // Show rate popup on first day of install.
    minLaunches:
        8, // Show rate popup after 8 launches of app after minDays is passed.
  );

  final widgetElements = new ListEntries(); // from listentries.dart
  bool isInterstitialAdLoaded = false;

  @override
  Future<void> initState() {
    FacebookAudienceNetwork.init(
      testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    );
    //This is for Rate My App
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await rateMyApp.init();
        if (mounted && rateMyApp.shouldOpenDialog) {
          rateMyApp.showRateDialog(context);
        }
      },
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

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
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

  //Initialize PackageInfo
  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(
      () {
        _packageInfo = info;
      },
    );
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
                try {
                  launchURL(Platform.isAndroid
                      ? Constants.URLOtherAppsAndroid
                      : Constants.URLOtherAppsIOS);
                } catch (exception, stackTrace) {
                  Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              trailing: Icon(Icons.apps),
            ),
            /*
            ListTile(
              title: Text(
                "About 1",
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
            // hasta aqui

             */
            ListTile(
              title: Text(
                "About",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationVersion: '\n Version: ' + _packageInfo.version,
                    applicationIcon: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: Constants.avatarRadius,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(Constants.avatarRadius)),
                          child: Image.asset("assets/logoaplanetbit.png")),
                    ),
                    applicationLegalese:
                        "\n\nSource: © 2021 National Association of Insurance Commissioners (NAIC). Reprinted with permission. Further reprint or distribution strictly prohibited without written permission of NAIC.\n \nIcons made by flaticon.com ",
                    applicationName: 'Dictionary of Insurance');
              },

              /*
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
              
                 */
              // fin
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text(
                "Rate Us",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                rateMyApp.showRateDialog(context);
                /*
                launchURL(Platform.isAndroid
                    ? Constants.URLRateUsAndroid
                    : Constants.URLRateUSIOS);

                 */
              },
              trailing: Icon(Icons.speed),
            ),
            ListTile(
              title: Text(
                "AplanetBit Web",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                try {
                  launchURL(Constants.URLAplanetBit);
                } catch (exception, stackTrace) {
                  Sentry.captureException(
                    exception,
                    stackTrace: stackTrace,
                  );
                }
              },
              trailing: Icon(Icons.cloud),
            ),
            ListTile(
              title: Text(
                "Search",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      searchTerm: ('Search your term'),
                    ),
                  ),
                );
              },
              trailing: Icon(Icons.search),
            ),
            ListTile(
              title: Text(
                "Alphabetical Index",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alphabeticalScreen(
                      searchTerm: ('Alphabetical index'),
                    ),
                  ),
                );
              },
              trailing: Icon(Icons.sort_by_alpha),
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
