import 'package:flutter/material.dart';
import 'package:zotero_app/library/Paper.dart';

import 'package:share_plus/share_plus.dart';

class SharePaperButton extends FloatingActionButton {
  final Paper? paper;
  final String? label;

  SharePaperButton({Paper? this.paper, String? this.label})
      : super.extended(
            onPressed: () => {Share.share("${paper?.title} \n ${paper?.doi??""}", subject: "Paper")},
            label: Text(label?? "Click me"),
            icon: const Icon(Icons.share));
}
