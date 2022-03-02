import 'package:flutter/material.dart';
import 'package:zotero_app/library/LibraryPage.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Collection.dart';

class CollectionWidget extends StatelessWidget {
  final Collection? collection;

  CollectionWidget({this.collection});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
                children: [
              Text(
                collection?.name ?? "No name",
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 3,
                softWrap: true,
              ),
              ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.open),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LibraryPage(collection: collection)));
                    //Navigator.pop(context);
                  })
            ],
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(border: Border.all(color: Colors.orange)));
  }
}
