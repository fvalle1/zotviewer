import 'dart:convert';
import 'package:zotero_app/library/Paper.dart';
import 'package:http/http.dart' as http;

class PaperMetadata {
  bool? isOpenAccess;
  int? citCount;
  int? influentialCitationsCount;
  String? year;
  String? abstract;
  String? tldr;
  List<String?>? authors;

  PaperMetadata(
      {this.isOpenAccess,
      this.influentialCitationsCount,
      this.citCount,
      this.abstract,
      this.year,
      this.tldr,
      this.authors});

  factory PaperMetadata.fromJson(Map<String, dynamic> json) {
    var tldr = json["tldr"] ?? {};
    return PaperMetadata(
        isOpenAccess: json["isOpenAccess"],
        influentialCitationsCount: json["influentialCitationCount"],
        citCount: json["numCitedBy"],
        abstract: json["abstract"],
        year: json["year"].toString(),
        tldr: tldr["text"],
        authors: (json["authors"] as List<dynamic>)
            .map((author) => author["authorId"] as String?)
            .toList());
  }
}

Future<PaperMetadata?> getMetadataOfPaper(Paper? paper) async {
  if (paper == null) return null;

  if (paper.doi != null) {
    var response = await http.get(
        Uri.parse("https://api.semanticscholar.org/graph/v1/paper/DOI:" +
            paper.doi! +
            "?fields=abstract,tldr,authors,citationCount,influentialCitationCount,year"),
        headers: {"x-api-key": "uX6gehXukZ6hMnBvqGonn9V4zCealjjq49tB3RIv"});
    if (response.statusCode == 200) {
      return PaperMetadata.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  return null;
}
