import 'package:flutter/material.dart';
import 'package:zotero_app/author/AuthorsPage.dart';

class AuthorsButton extends StatelessWidget {
  final List<String?>? Ids;

  AuthorsButton({Key? key, required List<String?>? this.Ids}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthorsPage(
              authorIds: Ids,
            ),
          ),
        );
      },
      child: Text('Authors'),
    );
  }
}
