class Paper {
  String? title;
  String? abstract;
  String? doi;
  String? journal;
  String? date;
  List<dynamic>? creators;

  Paper({this.title, this.doi, this.creators, this.abstract, this.journal, this.date});

  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
        title: json["data"]['title'] as String?,
        doi: json["data"]["DOI"] as String?,
        creators: json["data"]["creators"] as List<dynamic>?,
        abstract: json["data"]["abstractNote"] as String?,
        journal: json["data"]["publicationTitle"] as String?,
        date: json["data"]["date"] as String?);
  }
}
