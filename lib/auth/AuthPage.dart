import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
import 'package:zotero_app/main.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authUrl = getAuthUrl();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 1),
        Icon(Icons.login, size: 100),
        Spacer(flex: 1),
        Text(AppLocalizations.of(context)!.login),
        GestureDetector(
          onTap: authorize,
          child: FutureBuilder(
              future: authUrl,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString(),
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center);
                } else {
                  return Text("...",
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center);
                }
              }),
        ),
        Spacer(flex: 1),
        Text(AppLocalizations.of(context)!.loginCopy),
        TextField(
          onSubmitted: (String token) {
            login(token).then((val) => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MyHomePage())));
          },
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Token',
          ),
        ),
        Spacer(flex: 1),
      ],
    ));
  }
}
