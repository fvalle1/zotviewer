import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
// import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1),
        ElevatedButton(
          onPressed: clearCredentials,
          child: Text("Forget credentials",
              style: TextStyle(fontSize: 20)),
        ),
        Spacer(flex: 2),
      ],
    )));
  }
}
