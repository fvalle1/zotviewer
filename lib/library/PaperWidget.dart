import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:zotero_app/paper/PaperPage.dart';
import 'package:zotero_app/paper/doi.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Author.dart';

class PaperWidget extends StatelessWidget {
  final Paper? paper;

  PaperWidget({Key? key, this.paper}) : super(key: key);

  void _launchURLdoi() {
    launchURLdoi(paper!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          children: [
            ElevatedButton(
                child: Text(
                  paper?.title ?? AppLocalizations.of(context)!.errorNoName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 3,
                  softWrap: true,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaperPage(paper: paper!)));
                  //Navigator.pop(context);
                }),
            paper?.creators != null
                ? Text(
                    paper!.creators!
                        .map<String>((creator) => parseCreator(creator))
                        .toList()
                        .sublist(0, paper!.creators!.length > 3 ? 3: paper!.creators!.length)
                        .join(";"),
                  )
                : Text("..."),
            GestureDetector(
              onTap: _launchURLdoi,
              child: Text(paper?.doi ?? "...",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min),
    );
  }
}
