import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlText extends GestureDetector {
  static _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  UrlText(Uri uri, {String? text, TextStyle? style})
      : super(
            onTap: () {
              _launchUrl(uri);
            },
            child: Text(text ?? uri.toString(), style: style));
}
