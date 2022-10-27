// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:zotero_app/thankto/UrlText.dart';

class Source {
  String? name;
  Uri? GitHubUrl;
  Uri? url;
  String? license;
  Uri? licenseUrl;

  Source(
      {this.name,
      this.GitHubUrl,
      this.url,
      this.licenseUrl,
      this.license});

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
