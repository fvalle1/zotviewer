import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zotero_app/author/Author.dart';
import 'package:liquid_glass_ui_design/liquid_glass_ui.dart';


class AuthorWidget extends StatelessWidget {
  final String? authorId;
  late final Future<Author?> author;

  AuthorWidget({Key? key, required this.authorId}) : super(key: key) {
    this.author = getAuthor(authorId);
  }

  _launchAuthorPage(Author? author) async {
    //var url = author?.url;
    //if (url == null) return;

    var url = Uri.parse("https://scholar.google.com/scholar?q=" +
        (author?.name?.replaceAll(" ", "%20") ?? ""));
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (authorId == null)
      return Container();
    else
      return LiquidContainer(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<Author?>(
            future: author,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GestureDetector(
                    onTap: () => _launchAuthorPage(snapshot.data),
                    child: Column(children: <Widget>[
                      Text(snapshot.data?.name ?? "",
                          style: TextStyle(fontSize: 24)),
                      (snapshot.data?.hindex != null)
                          ? Text("h-index: ${snapshot.data?.hindex}",
                              style: TextStyle(fontSize: 20))
                          : Container(),
                      (snapshot.data?.nPubblication != null)
                          ? Text(
                              "Number of publication: ${snapshot.data?.nPubblication}",
                              style: TextStyle(fontSize: 20))
                          : Container(),
                    ]));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }),
      );
  }
}
