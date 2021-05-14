import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'CollectionsGridView.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late Future<List<Widget>> collection;

  @override
  void initState() {
    super.initState();
    collection = getCollections(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Collections"),
        ),
        body: Center(
            child: FutureBuilder<List<Widget>>(
          future: collection,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
              return GridView.count(
                  primary: false,
                  padding:
                      const EdgeInsets.only(top: 10, left: 25, right: 25),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )));
  }
}
