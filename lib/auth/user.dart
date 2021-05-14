import 'dart:convert';

class User {
  String? username;
  String? id;
  String? apiKey;
  String? secret;

  User({this.username, this.id, this.apiKey, this.secret});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json["username"][0],
        id: json["userID"][0],
        apiKey: json["oauth_token"][0],
        secret: json["oauth_token_secret"][0]);
  }

  Map<String, dynamic> clientKeys() {
    return {
      "oauth_token": [apiKey],
      "oauth_token_secret": [secret],
      "userID": [id],
      "username": [username]
    };
  }

  static Map<String, dynamic> toJson(User user) {
    return user.clientKeys();
  }

  @override
  String toString() {
    return json.encode(clientKeys());
  }
}
