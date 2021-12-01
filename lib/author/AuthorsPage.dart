import 'package:flutter/material.dart';
import 'package:zotero_app/author/AuthorWidget.dart';

class AuthorsPage extends StatefulWidget {
  final List<String?>? authorIds;

  AuthorsPage({Key? key, this.authorIds}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authors'),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: widget.authorIds
                  ?.map((authorId) => AuthorWidget(authorId: authorId))
                  .toList() ??
              [],
        )),
      ),
    );
  }
}
