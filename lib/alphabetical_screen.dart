import 'package:flutter/material.dart';
import 'package:insurance_dictionary/alpha_searched_screen.dart';
// import 'listentries.dart';
import 'destination.dart';
import 'dart:convert';

// ignore: must_be_immutable
class alphabeticalScreen extends StatefulWidget {
  final String searchTerm;
  Map<String, String> results;
  alphabeticalScreen({this.searchTerm});

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

class _SearchScreenState extends State<alphabeticalScreen> {
  _SearchScreenState();

  var query;
  String searchedTerm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Back to Menu Items",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              /*
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    searchedTerm = query;
                    //search is done here. Put query here
                    filterSearchResults(searchedTerm);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search your term',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                ),
              ),
              //hasta aqui

               */
            ),
            Expanded(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/alphabet.json'),
                builder: (context, snapshot) {
                  var results;
                  // String query = 'Accident';
                  final items = json.decode(snapshot.data.toString());
                  try {
                    results = items
                        .where((item) => item['Entry']
                            .toString()
                            .startsWith(searchedTerm.toUpperCase()))
                        .toList();
                  } on NoSuchMethodError {
                    print('Error de tipos');
                    results = items;
                  } catch (e) {
                    print(e);
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      var entrada = results[index];
                      //print(entrada);

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 2.0),
                        color: Colors.transparent,
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            query = entrada['Entry'];
                            searchedTerm = query;
                            print('Query: ' + query);
                            print('searchedTerm: ' + searchedTerm);
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
                          color: Colors.blue[900],
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
              //child: searchedItems,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: bannerAd,
    );
  }
}
