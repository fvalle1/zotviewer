import 'package:zotero_app/thankto/Source.dart';

class FlutterSource extends Source {
  // ignore: non_constant_identifier_names
  FlutterSource({String? name, Uri? GitHubUrl, String? license})
      : super(
            name: name,
            url: Uri.parse("https://pub.dev/packages/$name"),
            GitHubUrl: GitHubUrl,
            license: license) {
    this.licenseUrl = Uri.parse("https://pub.dev/packages/$name/license");
  }
}
