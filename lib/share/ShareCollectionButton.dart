import 'package:flutter/material.dart';
import 'package:zotero_app/collections/Collection.dart';
import 'package:zotero_app/auth/authentication.dart';
import 'package:http/http.dart' as http;


import 'package:share_plus/share_plus.dart';

class ShareCollectionButton extends FloatingActionButton {
  final Collection? collection;
  final String? label;
  final String format;

  ShareCollectionButton(
      {this.collection,
      this.label,
      this.format = "bibtex"})
      : super.extended(
            onPressed: () {
              _getBib(collection, format: format).then((bibfile) {
              Share.share(bibfile ?? "");
              });
            },
            label: Text(label ?? "Click me"),
            icon: const Icon(Icons.import_export));

  static Future<String?> _getBib(Collection? collection,
      {String format = "bibtex"}) async {
    var clientKeys = getClientKeys()!;
    var url =
        'https://api.zotero.org/users/${clientKeys['userID'][0]}/collections';

    if (collection != null) {
      url += "/" + collection.key + "/items?format=" + format;
    }

    final response = await http.get(Uri.parse(url), headers: {
      "Zotero-API-Key": clientKeys['oauth_token'][0],
      'Zotero-API-Version': '3'
    });

    return response.body;
  }
}
