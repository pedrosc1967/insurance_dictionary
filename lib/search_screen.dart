import 'package:flutter/material.dart';
import 'listentries.dart';
import 'destination.dart';
import 'dart:convert';

// ignore: must_be_immutable
class searchScreen extends StatefulWidget {
  final String searchTerm;
  Map<String, String> results;
  searchScreen({this.searchTerm});

  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

filterSearchResults(query) async {
  try {
    final items = json.decode('assets/data.json'.toString());
    var results = items
        .where((item) => item['Entry'].toString().contains(query))
        .toList();
    return results;
  } on FormatException {
    print('Unexpected character');
  }
}

class _SearchScreenState extends State<searchScreen> {
  _SearchScreenState();

  String searchedTerm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Back to Main Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (query) {
                  setState(() {
                    // print(query);
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
            ),
            Expanded(
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/data.json'),
                builder: (context, snapshot) {
                  var results;
                  // String query = 'Accident';
                  final items = json.decode(snapshot.data.toString());
                  try {
                    results = items
                        .where((item) =>
                            item['Entry'].toString().contains(searchedTerm))
                        .toList();
                    //  print(query);
                  } on NoSuchMethodError {
                    print('Error de  tipos');
                    results = items;
                  } catch (e) {
                    print(e);
                    //results = items;
                  }

                  //print(items);
                  //print(results);
                  //print(results.length);
                  // results = items;

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Destination(
                                  entry: entrada['Entry'],
                                  definition: entrada['Definition'],
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
