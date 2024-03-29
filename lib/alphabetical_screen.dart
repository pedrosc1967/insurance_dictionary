import 'package:flutter/material.dart';
import 'package:insurance_dictionary/alpha_searched_screen.dart';
import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class AlphabeticalScreen extends StatefulWidget {
  final String searchTerm;
  Map<String, String> results;
  AlphabeticalScreen({this.searchTerm});

  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

filterSearchResults(query) async {
  try {
    final items = json.decode('assets/alphabet.json'.toString());
    var results = items
        .where((item) =>
            item['Entry'].toString().startsWith(query.toString().toUpperCase()))
        .toList();
    return results;
  } on FormatException {
    print('Unexpected character');
  }
}

class _SearchScreenState extends State<AlphabeticalScreen> {
  _SearchScreenState();

  var query;
  String searchedTerm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'back_menu'.tr(),
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
            ),
            Expanded(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/alphabet.json'),
                builder: (context, snapshot) {
                  var results;
                  final items = json.decode(snapshot.data.toString());
                  try {
                    results = items
                        .where((item) => item['Entry']
                            .toString()
                            .startsWith(searchedTerm.toUpperCase()))
                        .toList();
                  } on NoSuchMethodError {
                    print('Type mismatch error');
                    results = items;
                  } catch (e) {
                    print(e);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var entrada = results[index];

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 2.0),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[900],
                            onPrimary: Colors.white,
                            shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                            minimumSize:
                                Size(double.infinity, 40), // full width
                          ),
                          onPressed: () {
                            query = entrada['Entry'];
                            searchedTerm = query;
                            //search is done here. Put query here
                            filterSearchResults(searchedTerm);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AlphaSearchedScreen(
                                  searchTerm: entrada['Entry'],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            entrada['Entry'],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: results == null ? 0 : results.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: bannerAd,
    );
  }
}
