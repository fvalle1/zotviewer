import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
import 'package:zotero_app/main.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var authUrl = getAuthUrl();
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("In order to login go to the following address"),
        GestureDetector(
          onTap: authorize,
          child: FutureBuilder(
              future: authUrl,
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString(),
                      style: TextStyle(fontStyle: FontStyle.italic));
                } else {
                  return Text("...",
                      style: TextStyle(fontStyle: FontStyle.italic));
                }
              }),
        ),
        Text("Then copy here the authorisation code"),
        TextField(
          onSubmitted: (String token) {
            login(token);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'API access token',
          ),
        )
      ],
    ));
  }
}
