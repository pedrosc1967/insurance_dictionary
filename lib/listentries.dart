import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

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

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var entrada = entries[index];
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("\n" + entrada['Entry'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        new Text(entrada['Definition'] + "\n",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20)),
                      ],
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
