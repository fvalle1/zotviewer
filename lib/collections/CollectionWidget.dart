import 'package:flutter/material.dart';
import 'package:zotero_app/library/LibraryPage.dart';
import 'package:liquid_glass_ui_design/liquid_glass_ui.dart';

import '../l10n/app_localizations.dart';

import 'Collection.dart';

class CollectionWidget extends StatelessWidget {
  final Collection? collection;

  CollectionWidget({this.collection});

  @override
  Widget build(BuildContext context) {
    return LiquidContainer(
      child:Column(
                children: [
              Text(
                collection?.name ?? "No name",
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 3,
                softWrap: true,
              ),
              LiquidButton(
                  child: Text(AppLocalizations.of(context)!.open),
                  onTap: () {
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
                color: Colors.orange
                );
  }
}
