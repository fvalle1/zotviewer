import 'package:flutter/material.dart';
import 'package:zotero_app/collections/CollectionsPage.dart';
import 'package:zotero_app/auth/AuthPage.dart';
import 'package:zotero_app/pages/InfoPage.dart';
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
  int _selectedIndex = 0;

  void _onBottomItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return isLoggedIn() ? CollectionPage() : AuthPage();
      case 1:
        clearCredentials(); //logOut
        return AuthPage();
      case 2:
        return InfoPage();
      default:
        return AuthPage();
    }
  }

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
                return _getBody(_selectedIndex);
              } else {
                return Text("Loading...",
                    style: TextStyle(fontWeight: FontWeight.bold));
              }
            }),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orangeAccent[600],
          onTap: _onBottomItemTapped,
        ));
  }
}
