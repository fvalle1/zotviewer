class Collection {
  String? name;
  String key;

  Collection({required this.key, this.name});

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
        key: json["key"]!,
        name: json["data"]['name'] as String?);
  }
}
