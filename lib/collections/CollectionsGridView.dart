import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zotero_app/auth/fake_authentication.dart';
import 'package:http/http.dart' as http;

import 'Collection.dart';
import 'CollectionWidget.dart';

Future<List<Widget>> getCollections(http.Client client,
    {Collection? subcollection}) async {
  var clientKeys = getClientKeys();

  var url =
      'https://api.zotero.org/users/${clientKeys['userID'][0]}/collections';

  if (subcollection != null) {
    url += "/" + subcollection.key + "/collections";
  }

  final response = await client.get(Uri.parse(url), headers: {
    "Zotero-API-Key": clientKeys['oauth_token'][0],
    'Zotero-API-Version': '3'
  });
  var parsed = jsonDecode(response.body);
  return parsed
          .map<CollectionWidget>(
              (json) => CollectionWidget(collection: Collection.fromJson(json)))
          .toList();
}
