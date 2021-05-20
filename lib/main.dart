import 'package:flutter/material.dart';
import 'package:zotero_app/collections/CollectionsPage.dart';
import 'package:zotero_app/auth/AuthPage.dart';
import 'package:zotero_app/pages/InfoPage.dart';
import 'package:zotero_app/pages/SettingsPage.dart';
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

  Future<Widget> _getBody(int index) async {
    switch (index) {
      case 0:
        await lookForCredentials();
        return isLoggedIn() ? CollectionPage() : AuthPage();
      case 1:
        return SettingsPage();
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
        body: FutureBuilder<Widget>(
            future: _getBody(_selectedIndex),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              if (snapshot.hasData) {
                return snapshot.data!;
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
              icon: Icon(Icons.settings_applications),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orangeAccent[600],
          onTap: _onBottomItemTapped,
        ));
  }
}
