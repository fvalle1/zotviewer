import 'dart:convert';
import 'package:http/http.dart' as http;

class Author {
  String id;
  String? name;
  String? url;
  int? hindex;
  int? nPubblication;
  int? nCitations;

  Author(
      {required this.id,
      this.name,
      this.hindex,
      this.nPubblication,
      this.nCitations,
      this.url});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
        id: json["authorId"] ?? "null",
        name: json["name"],
        hindex: json["hIndex"],
        nPubblication: json["paperCount"],
        nCitations: json["citationCount"],
        url: json["url"]);
  }
}

Future<Author?> getAuthor(String? authorId) async {
  if (authorId == null) return null;

  var response = await http.get(Uri.parse(
      "https://api.semanticscholar.org/graph/v1/author/" +
          authorId +
          "?fields=name,hIndex,paperCount,citationCount,url"));
  if (response.statusCode == 200) {
    return Author.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}
