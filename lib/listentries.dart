import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'destination.dart';

class ListEntries extends StatefulWidget {
  ListEntries({Key key}) : super(key: key);

  @override
  ListEntriesState createState() => ListEntriesState();
}

class ListEntriesState extends State<ListEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/data.json'),
            builder: (context, snapshot) {
              var entries = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var entrada = entries[index];
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
                          fontSize: 22.0,
                        ),
                      ),

                      /*Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("\n" + entrada['Entry'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24)),
                          Text(entrada['Definition'] + "\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20)),
                        ],
                      ),
                    ); */
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
