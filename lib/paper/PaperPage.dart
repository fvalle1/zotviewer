import 'package:flutter/material.dart';
import 'package:zotero_app/library/Author.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:zotero_app/paper/doi.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaperPage extends StatelessWidget {
  late final Paper paper;

  PaperPage({Key? key, required this.paper}) : super(key: key);

  void _launchURLdoi() {
    launchURLdoi(paper);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(paper.title ?? "Paper"),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
              children: [
                Text(
                  paper.title ?? AppLocalizations.of(context)!.errorNoName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  maxLines: 3,
                  softWrap: true,
                ),
                paper.creators != null
                    ? Text(
                        paper.creators!
                            .map<String>((creator) => parseCreator(creator))
                            .toList()
                            .sublist(0, paper.creators!.length > 10 ? 10 : paper.creators!.length)
                            .join(";"),
                      )
                    : Text("..."),
                GestureDetector(
                  onTap: _launchURLdoi,
                  child: Text(paper.doi ?? "...",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 30)),
                ),
                Text(paper.abstract ?? "...", style: TextStyle(fontSize: 24))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min),
        ))));
  }
}
