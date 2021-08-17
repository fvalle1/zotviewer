import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
// import 'package:package_info/package_info.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1),
        ElevatedButton(
          onPressed: clearCredentials,
          child: Text(AppLocalizations.of(context)!.forgot,
              style: TextStyle(fontSize: 20)),
        ),
        Spacer(flex: 2),
      ],
    )));
  }
}
