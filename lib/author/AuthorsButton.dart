import 'package:flutter/material.dart';
import 'package:zotero_app/author/AuthorsPage.dart';

class AuthorsButton extends StatelessWidget {
  final List<String?>? ids;

  AuthorsButton({Key? key, required this.ids}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AuthorsPage(
              authorIds: ids,
            ),
          ),
        );
      },
      child: Text('Authors'),
    );
  }
}
