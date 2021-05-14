import 'package:flutter/material.dart';
import 'package:zotero_app/collections/CollectionsPage.dart';
import 'package:zotero_app/auth/AuthPage.dart';
import 'package:zotero_app/theme/MyTheme.dart';

import 'auth/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zotero Viewer',
      theme: getMyTheme(),
      home: MyHomePage(title: 'ZotViewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<bool> credetialsChecked;

  @override
  void initState() {
    super.initState();
    credetialsChecked = lookForCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? "ZotViewer"),
        ),
        body: FutureBuilder<bool>(
            future: credetialsChecked,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                return isLoggedIn() ? CollectionPage() : AuthPage();
              } else {
                return Text("Loading...",
                    style: TextStyle(fontWeight: FontWeight.bold));
              }
            }));
  }
}
