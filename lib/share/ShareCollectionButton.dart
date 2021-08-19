import 'package:flutter/material.dart';
import 'package:zotero_app/library/Paper.dart';

import 'package:share_plus/share_plus.dart';

class ShareCollectionButton extends FloatingActionButton {
  final Paper? paper;
  final String? label;

  ShareCollectionButton({Paper? this.paper, String? this.label})
      : super.extended(
            onPressed: () => {Share.share("${label} ${paper?.title}", subject: "Paper")},
            label: Text(label?? "Click me"),
            icon: const Icon(Icons.share));
}
