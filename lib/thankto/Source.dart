import 'package:flutter/material.dart';
import 'package:zotero_app/thankto/UrlText.dart';

class Source {
  String? name;
  Uri? GitHubUrl;
  Uri? url;
  String? license;
  Uri? licenseUrl;

  Source(
      {String? this.name,
      Uri? this.GitHubUrl,
      Uri? this.url,
      Uri? this.licenseUrl,
      String? this.license});

  toWidget() {
    return Card(
        child: Column(children: [
      Text(name ?? "", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      (url != null) ? UrlText(url!) : Text(""),
      (licenseUrl != null)
          ? UrlText(licenseUrl!, text: license, style: TextStyle(fontSize: 20))
          : Text(license ?? "", style: TextStyle(fontSize: 20)),
    ]));
  }
}
