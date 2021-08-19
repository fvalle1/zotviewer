import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
// import 'package:package_info/package_info.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zotero_app/thankto/ThankToPage.dart';

class SettingsButtonsStyle extends TextStyle {
  SettingsButtonsStyle() : super(fontSize: 20);
}

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
                  style: new SettingsButtonsStyle()),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThankToPage()));
                },
                child: Text(AppLocalizations.of(context)!.licences,
                    style: new SettingsButtonsStyle())),
            Spacer(flex: 2),
          ],
        )));
  }
}
