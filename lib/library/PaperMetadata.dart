import 'dart:convert';

import 'package:zotero_app/library/Paper.dart';

import 'package:http/http.dart' as http;

class PaperMetadata {
  bool? isOpenAccess;
  int? citCount;
  int? influentialCitationsCount;
  String? year;
  String? abstract;

  PaperMetadata(
      {this.isOpenAccess,
      this.influentialCitationsCount,
      this.citCount,
      this.abstract,
      this.year});

  factory PaperMetadata.fromJson(Map<String, dynamic> json) {
    return PaperMetadata(
        isOpenAccess: json["isOpenAccess"],
        influentialCitationsCount: json["influentialCitationCount"],
        citCount: json["numCitedBy"],
        abstract: json["abstract"],
        year: json["year"].toString());
  }
}

Future<PaperMetadata?> getMetadataOfPaper(Paper? paper) async {
  if (paper == null) return null;

  if (paper.doi != null) {
    var response = await http.get(Uri.parse(
        "https://api.semanticscholar.org/v1/paper/DOI:" + paper.doi!));
    if (response.statusCode == 200) {
      return PaperMetadata.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  return null;
}
