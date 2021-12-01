import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends GestureDetector {
  static _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  UrlText(Uri uri, {String? text, TextStyle? style})
      : super(
            onTap: () {
              _launchUrl(uri.toString());
            },
            child: Text(text ?? uri.toString(), style: style));
}
