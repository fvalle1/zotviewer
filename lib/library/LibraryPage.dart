import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zotero_app/auth/authentication.dart';
import 'package:zotero_app/collections/Collection.dart';
import 'package:zotero_app/collections/CollectionsGridView.dart';
import 'package:zotero_app/library/PaperWidget.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zotero_app/share/ShareCollectionButton.dart';

class LibraryPage extends StatefulWidget {
  final Collection? collection;

  LibraryPage({Key? key, this.collection}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late Future<Column> _library;

  Future<Column> getLibrary(http.Client client) async {
    var clientKeys = getClientKeys()!;

    final response = await client.get(
        Uri.parse(
            "https://api.zotero.org/users/${clientKeys['userID'][0]}/collections/${widget.collection?.key}/items/"),
        headers: {
          "Zotero-API-Key": clientKeys['oauth_token'][0],
          'Zotero-API-Version': '3'
        });
    var parsed = jsonDecode(response.body);
    return Column(
      children: parsed
          .map<PaperWidget>((json) => PaperWidget(paper: Paper.fromJson(json)))
          .toList(),
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  @override
  void initState() {
    super.initState();
    _library = getLibrary(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.collection?.name ??
              AppLocalizations.of(context)!.collection),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
                  FutureBuilder<List<Widget>>(
                      future: getCollections(http.Client(),
                          subcollection: widget.collection),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        if (snapshot.hasData) {
                          return Row(
                            children: snapshot.data!,
                            mainAxisAlignment: MainAxisAlignment.center,
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                  FutureBuilder<Column>(
                    future: _library,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                ]),
                padding: EdgeInsets.only(top: 10, left: 25, right: 25))),
        floatingActionButton: new ShareCollectionButton(
            collection: widget.collection,
            label: AppLocalizations.of(context)!.export));
  }
}
