import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Image(
            image: NetworkImage(
                "https://bitbucket.org/fvalle01/zotviewer/raw/531f9dc22d32e33454b642f5178d723b1e848663/icon.png"),
                errorBuilder: (context, obj, st)=>Container(),),
        Text("This app v 1.1.0", style: TextStyle(fontSize: 25)),
        Text("by Filippo Valle",
            style: TextStyle(fontSize: 25)),
        Text("It is an open source project https://bitbucket.org/fvalle01/zotviewer/src/main/",
            style: TextStyle(fontSize: 25)),
        Text("Released under GPL v3",
            style: TextStyle(fontSize: 25)),
      ],
    )));
  }
}
