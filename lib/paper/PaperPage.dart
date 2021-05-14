import 'package:flutter/material.dart';
import 'package:zotero_app/library/Author.dart';
import 'package:zotero_app/library/Paper.dart';
import 'package:zotero_app/paper/doi.dart';

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
                  paper.title ?? "No title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  maxLines: 3,
                  softWrap: true,
                ),
                paper.creators != null
                    ? Flex(
                        direction: Axis.horizontal,
                        children: paper.creators!
                            .map<Text>((creator) => parseCreator(creator))
                            .toList(),
                        mainAxisAlignment: MainAxisAlignment.center,
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
