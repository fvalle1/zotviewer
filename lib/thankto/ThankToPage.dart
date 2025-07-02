import 'package:flutter/material.dart';
import 'package:zotero_app/thankto/FlutterSource.dart';
import 'package:zotero_app/thankto/Source.dart';
import '../l10n/app_localizations.dart';


class ThankToPage extends StatelessWidget {
  final List<Source> sources = [
    Source(name: "Zotero", url: Uri.parse("https://www.zotero.org/support/dev/web_api/v3/start")),
    FlutterSource(
        name: 'oauth1',
        GitHubUrl: Uri.parse("https://github.com/nbspou/dart-oauth1"),
        license: "BSD"),
    FlutterSource(
        name: 'path_provider',
        GitHubUrl: Uri.parse("https://github.com/flutter/plugins"),
        license: "BSD"),
    FlutterSource(
        name: 'http',
        GitHubUrl: Uri.parse("https://github.com/dart-lang/http"),
        license: "BSD"),
    FlutterSource(
        name: 'url_launcher',
        GitHubUrl: Uri.parse("https://github.com/flutter/plugins/tree/master/packages/url_launcher/url_launcher"),
        license: "BSD"),
    FlutterSource(
      name: 'google_fonts',
      GitHubUrl: Uri.parse("https://github.com/material-foundation/google-fonts-flutter/"),
      license: "Apache 2.0"),
    FlutterSource(
        name: 'intl',
        GitHubUrl: Uri.parse(
            "https://github.com/dart-lang/intl"),
        license: "BSD"),
    FlutterSource(
      name: 'share_plus',
      GitHubUrl: Uri.parse("https://github.com/fluttercommunity/plus_plugins/tree/main/packages/"),
      license: "BSD")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.licences),
        ),
        body: ListView(
            children:
                sources.map<Widget>((source) => source.toWidget()).toList()));
  }
}
