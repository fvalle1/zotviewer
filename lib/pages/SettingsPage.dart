import 'package:flutter/material.dart';
import 'package:liquid_glass_ui_design/liquid_glass_ui.dart';
import 'package:zotero_app/auth/authentication.dart';
// import 'package:package_info/package_info.dart';

import '../l10n/app_localizations.dart';
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: LiquidButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThankToPage()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Center(
                      child: Text("Credits",
                          style: new SettingsButtonsStyle(),
                          textAlign: TextAlign.center),
                    ),
                  )),
            ),
            Spacer(flex: 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: LiquidButton(
                onTap: clearCredentials,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.forgot,
                        style: new SettingsButtonsStyle(),
                        textAlign: TextAlign.center),
                  ),
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        )));
  }
}
