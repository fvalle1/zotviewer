import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:oauth1/oauth1.dart' as oauth1;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zotero_app/auth/user.dart';
import 'package:zotero_app/auth/my_api_credentials.dart';
//import 'package:zotero_app/auth/api_credentials.dart'; // uncomment this and comment the above

oauth1.Authorization? auth;
oauth1.Credentials? credentials;
User? user;

Future<File> _getFile() async {
  final directory = await getApplicationDocumentsDirectory();
  final String credentialsFilename = directory.path + '/.credentials.json';
  var credentialsFile = File(credentialsFilename);
  return credentialsFile;
}

Future<bool> lookForCredentials() async {
  if (!kIsWeb) {
    var credentialsFile = await _getFile();
    var exists = await credentialsFile.exists();
    if (exists) {
      var string = await credentialsFile.readAsString();
      if (string.isEmpty) {
        user = null;
        return false;
      } else
        user = User.fromJson(jsonDecode(string));
    } else {
      return false;
    }

    return true;
  } else {
    return false;
  }
}

void clearCredentials() async {
  user = null;
  if (!kIsWeb) {
    _getFile().then((credentialsFile) =>
        credentialsFile.exists().then((val) => credentialsFile.delete()));
  }
}

Map<String, dynamic>? getClientKeys() {
  return user?.clientKeys();
}

bool isLoggedIn() {
  return !(user == null);
}

oauth1.Authorization getAuthorization() {
  var platform = new oauth1.Platform(
      'https://www.zotero.org/oauth/request', // temporary credentials request
      'https://www.zotero.org/oauth/authorize', // resource owner authorization
      'https://www.zotero.org/oauth/access', // token credentials request
      oauth1.SignatureMethods.hmacSha1 // signature method
      );
  // define client credentials (consumer keys)
  var clientCredentials = new oauth1.ClientCredentials(apiKey, apiSecret);

  // create Authorization object with client credentials and platform definition
  var auth = new oauth1.Authorization(clientCredentials, platform);
  return auth;
}

Future<Uri> getAuthUrl() async {
  if (auth == null) auth = getAuthorization();
  var res = await auth!.requestTemporaryCredentials('oob');
  credentials = res.credentials;
  var authorizationUrl = Uri.parse(
      auth!.getResourceOwnerAuthorizationURI(credentials?.token ?? ""));
  print(authorizationUrl);
  return authorizationUrl;
}

void authorize() async {
  var authorizationUrl = await getAuthUrl();
  if (await canLaunch(authorizationUrl.toString())) {
    await launch(authorizationUrl.toString(),
        forceSafariVC: true, forceWebView: true);
  }
}

void login(String verifier) async {
  if (auth == null) auth = getAuthorization();

  var tokenRes = await auth!.requestTokenCredentials(credentials!, verifier);
  var zoteroUserID = tokenRes.optionalParameters['userID'] ?? "";
  var zoteroName = tokenRes.optionalParameters['username'] ?? "";
  var zoteroApiKey = tokenRes.credentials.token;
  var zoteroApiSecret = tokenRes.credentials.tokenSecret;

  user = User(
      username: zoteroName,
      id: zoteroUserID,
      apiKey: zoteroApiKey,
      secret: zoteroApiSecret);

  print(user);
  var credentialsFile = await _getFile();
  await credentialsFile.writeAsString(user.toString());
}
