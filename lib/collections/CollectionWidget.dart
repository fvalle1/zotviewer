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
      borderRadius: 16,
      padding: const EdgeInsets.all(8),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: Column(
        children: [
          Icon(
            Icons.folder_outlined,
            size: 28,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 6),
          Text(
            collection?.name ?? "No name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6),
          LiquidButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.open,
                  style: TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LibraryPage(collection: collection)),
              );
            },
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
