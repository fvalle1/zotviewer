import 'package:flutter/material.dart';
import 'package:zotero_app/library/Author.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:zotero_app/library/PaperMetadata.dart';
import 'package:zotero_app/paper/doi.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:zotero_app/share/SharePaperButton.dart';

class PaperPage extends StatelessWidget {
  late final Paper paper;
  late final Future<PaperMetadata?>? paperMeta;

  PaperPage({Key? key, required this.paper}) : super(key: key) {
    this.paperMeta = getMetadataOfPaper(this.paper);
  }

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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  maxLines: 3,
                  softWrap: true,
                ),
                paper.creators != null
                    ? Text(
                        paper.creators!
                            .map<String>((creator) => parseCreator(creator))
                            .toList()
                            .sublist(
                                0,
                                paper.creators!.length > 10
                                    ? 10
                                    : paper.creators!.length)
                            .join(";"),
                      )
                    : Text("..."),
                Text(((paper.date?.length ?? -1) > 0) ? "(${paper.date})" : "", style: TextStyle(fontSize: 20)),
                GestureDetector(
                  onTap: _launchURLdoi,
                  child: Text(paper.doi ?? "...",
                      style:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 20)),
                ),
                FutureBuilder<PaperMetadata?>(
                    future: this.paperMeta,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Card(
                          shadowColor: Colors.indigo,
                            child: Flex(direction: Axis.vertical, children: [
                              ((paper.date?.length ?? -1) > 0)
                              ? Text("")
                              : Text((snapshot.data!.year != null) ? "(${snapshot.data!.year})" : "...",
                                  style: TextStyle(fontSize: 20)),
                          Text(
                            (snapshot.data?.isOpenAccess ?? false
                                    ? AppLocalizations.of(context)!.itis
                                    : AppLocalizations.of(context)!.itisnot) +
                                " Open Access",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20),
                          ),
                          Text(
                              AppLocalizations.of(context)!
                                  .nCit(snapshot.data?.citCount ?? 0),
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 20)),
                          Text(
                            AppLocalizations.of(context)!.nInfluentialCit(
                                snapshot.data?.influentialCitationsCount ?? 0),
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 20),
                          ),
                          ((paper.abstract?.length ?? 0) > 0)
                              ? Text("")
                              : Text(snapshot.data!.abstract ?? ("..."),
                                  style: TextStyle(fontSize: 22))
                        ]));
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return Text("...");
                      }
                    }),
                Text(paper.abstract ?? ("..."), style: TextStyle(fontSize: 22))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min),
        ))),
        floatingActionButton: new SharePaperButton(paper: paper, label: AppLocalizations.of(context)!.share),
        );
  }
}
