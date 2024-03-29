import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:insurance_dictionary/constants.dart';
import 'package:insurance_dictionary/globals.dart';
import 'package:insurance_dictionary/utils/responsive.dart';
import 'destination.dart';
import 'package:insurance_dictionary/facebook_code.dart';
import 'dart:io';

class ListEntries extends StatefulWidget {
  ListEntries({Key key, String entry, String definition}) : super(key: key);

  get myIterable => null;

  @override
  ListEntriesState createState() => ListEntriesState();
}

class ListEntriesState extends State<ListEntries> {
  bool isFirstUse = true;
  int numUses = 0;
  int cycle = 5;
  static List<ListEntries> listOfEntries;
  static String estaEntrada;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(dataFilename),
            builder: (context, snapshot) {
              var entries = json.decode(snapshot.data.toString());
              //print(entries);
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var entrada = entries[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    color: Colors.transparent,
                    width: responsive.wp(100),
                    height: responsive.hp(9),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[500],
                        onPrimary: Colors.white,
                        shadowColor: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(responsive.wp(100), 40), // full width
                      ),
                      onPressed: () {
                        if (numUses % cycle == 1) {
                          loadInterstitialAd();
                          sleep(Duration(milliseconds: 100));
                          showInterstitialAd();
                          isFirstUse = false;
                          numUses++;
                        } else {
                          numUses++;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Destination(
                                entry: entrada['Entry'],
                                definition: entrada['Definition'],
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        entrada['Entry'],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Doboto',
                          fontStyle: FontStyle.italic,
                          fontSize:
                              responsive.hp(Constants.heigthPercentFontSize),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: entries == null ? 0 : entries.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
