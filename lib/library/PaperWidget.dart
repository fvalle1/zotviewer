import 'package:flutter/material.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:zotero_app/paper/PaperPage.dart';
import 'package:zotero_app/paper/doi.dart';
import '../l10n/app_localizations.dart';
import 'AuthorHelper.dart';
import 'package:liquid_glass_ui_design/liquid_glass_ui.dart';

class PaperWidget extends StatelessWidget {
  final Paper? paper;

  PaperWidget({Key? key, this.paper}) : super(key: key);

  void _launchURLdoi() {
    launchURLdoi(paper!);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PaperPage(paper: paper!)));
      },
      child: LiquidCard(
        borderRadius: 20,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.article_outlined,
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    paper?.title ?? AppLocalizations.of(context)!.errorNoName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            paper?.creators != null
                ? Row(
                    children: [
                      Icon(
                        Icons.person_outline,
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          paper!.creators!
                              .map<String>((creator) => parseCreator(creator))
                              .toList()
                              .sublist(
                                  0,
                                  paper!.creators!.length > 3
                                      ? 3
                                      : paper!.creators!.length)
                              .join("; "),
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).textTheme.bodyMedium?.color,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                : Text("..."),
            SizedBox(height: 8),
            GestureDetector(
              onTap: _launchURLdoi,
              child: Row(
                children: [
                  Icon(
                    Icons.link,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      paper?.doi ?? "...",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}
